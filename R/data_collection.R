library(httr)
library(jsonlite)

collect_twitter_data <- function(api_key, api_secret_key, access_token, access_token_secret, hashtag, n_tweets) {
  url <- paste0("https://api.twitter.com/2/tweets/search/recent?query=%23", hashtag, "&max_results=", n_tweets)
  response <- GET(url, authenticate(api_key, api_secret_key, type = "basic"), add_headers(Authorization = paste("Bearer", access_token)))
  data <- fromJSON(content(response, as = "text"))
  return(data)
}
