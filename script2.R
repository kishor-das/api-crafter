library(httr2)
library(xml2)
library(dplyr)
library(jsonlite)

base_url <- "http://openaccess.pf.api.met.ie/metno-wdb2ts/locationforecast"
lat_coord <- "53.2707"
long_coord <- "-9.0568"

request_obj <- request(base_url) |>
  req_url_query(lat = lat_coord, long = long_coord)

response <- req_perform(request_obj)

if (resp_status(response) == 200) {
  xml_data <- resp_body_xml(response)

  # Find nodes containing temperature information
  time_nodes <- xml_find_all(xml_data, ".//time[.//temperature]")

  # Create the final data frame
  forecast_df <- data.frame(
    Time_From = xml_attr(time_nodes, "from"),
    Time_To = xml_attr(time_nodes, "to"),
    Temp_C = as.numeric(xml_attr(
      xml_find_first(time_nodes, ".//temperature"),
      "value"
    )),
    stringsAsFactors = FALSE
  )

  print(head(forecast_df, 15))
} else {
  stop(paste("Failed to fetch data. HTTP Status:", resp_status(response)))
}


clean_forecast <- forecast_df |>
  # Convert the API character timestamps into R POSIXct datetimes
  mutate(
    Time_From = as.POSIXct(
      Time_From,
      format = "%Y-%m-%dT%H:%M:%SZ",
      tz = "UTC"
    ),
    Time_To = as.POSIXct(Time_To, format = "%Y-%m-%dT%H:%M:%SZ", tz = "UTC")
  ) |>
  # Keep only unique time steps for a clean 10-day sequence
  distinct(Time_From, .keep_all = TRUE)

summary(clean_forecast)


temp_list <- list(temp = 21, min = 14, max = 24, location = "Galway City")

temp_json <- toJSON(temp_list, simplifyVector = TRUE, pretty = TRUE)

writeLines(temp_json, "data.txt")
