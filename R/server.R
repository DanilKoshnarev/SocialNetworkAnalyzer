library(shiny)
library(httr)
library(jsonlite)
library(igraph)
library(visNetwork)

source("R/data_collection.R")
source("R/graph_analysis.R")

server <- function(input, output) {
  data <- eventReactive(input$analyze, {
    api_key <- Sys.getenv("API_KEY")
    api_secret_key <- Sys.getenv("API_SECRET_KEY")
    access_token <- Sys.getenv("ACCESS_TOKEN")
    access_token_secret <- Sys.getenv("ACCESS_TOKEN_SECRET")
    collect_twitter_data(api_key, api_secret_key, access_token, access_token_secret, input$hashtag, input$n_tweets)
  })
  
  analysis <- reactive({
    analyze_network(data())
  })
  
  output$network_plot <- renderVisNetwork({
    visIgraph(analysis()$graph)
  })
  
  output$centralities_table <- renderTable({
    analysis()$centralities
  })
}
