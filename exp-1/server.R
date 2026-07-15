library(plumber)

#* Search for an item
#* @get /items
function(category = "all") {
  # Plumber parses 'category' from the URL query string
  list(
    status = "success",
    message = paste("Showing items for category:", category)
  )
}

#* Add a new item
#* @post /items
function(req) {
  # Plumber parses 'req$body' from the incoming JSON payload
  new_item <- req$body
  
  list(
    status = "created",
    received_data = new_item
  )
}


# pr("exp-1/server.R") |> pr_run(port = 8000)