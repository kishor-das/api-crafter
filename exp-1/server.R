library(plumber)

#* Search for an item
#* @serializer json
#* @get /items
function(category = "all") {
  # Plumber parses 'category' from the URL query string
  list(
    status = "success",
    message = paste("Showing items for category:", category)
  )
}

#* Add a new item
#* @serializer json
#* @post /items
function(req) {
  # Plumber parses 'req$body' from the incoming JSON payload
  new_item <- req$body

  list(
    status = "created",
    received_data = new_item
  )
}


#* Add a new item
#* @serializer json
#* @post /output
function(code, req) {
  if (is.null(code)) {
    out <- "No code provided"
  } else {
    out <- capture.output(eval(parse(text = code)))
  }
  client_ip <- req$REMOTE_ADDR

  list(
    status = "created",
    output = out,
    ip = client_ip 
  )
}

# pr("exp-1/server.R") |> pr_run(port = 8000)
