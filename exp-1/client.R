library(httr2)

# GET endpoint

# 1. Build and format the GET request
get_req <- request("http://127.0.0.1:8000/items") |> 
  req_url_query(category = "shoes")

# 2. Perform the request
get_resp <- req_perform(get_req)

# 3. Unpack and read the nice JSON response body
resp_body_json(get_resp)
# Returns: list(status = "success", message = "Showing items for category: shoes")

# POST endpoint

# 1. Build and format the POST request
post_req <- request("http://127.0.0.1:8000/items") |> 
  req_body_json(list(name = "Running Shoes", price = 89.99))

# 2. Perform the request
post_resp <- req_perform(post_req)

# 3. Unpack the response body
resp_body_json(post_resp)
# Returns: list(status = "created", received_data = list(name = "Running Shoes", price = 89.99))




post_req <- request("http://127.0.0.1:8000/output") |> 
  req_body_json(list(code = "version"))

# 2. Perform the request
post_resp <- req_perform(post_req)

# 3. Unpack the response body
resp_body_json(post_resp)
# Returns: list(status = "created", received_data = list(name = "Running Shoes", price = 89.99))
