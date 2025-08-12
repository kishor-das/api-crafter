library(tidyverse)
library(httr2)
library(xml2)
library(xslt)

# Met Eireann API reference: https://weather.apis.ie/docs/


req <- request("http://openaccess.pf.api.met.ie/metno-wdb2ts/locationforecast?lat=53.270962;long=-9.062691")

resp <- req |> req_perform()

resp|> resp_raw()

weather_xml <- resp|> resp_body_xml()

weather_style <- read_xml("weather_csv.xsl")

weather_csv <- xml_xslt(weather_xml, weather_style) 

connection <- textConnection(weather_csv)
data <- read.csv(connection)
close(connection)
data

View(data)
