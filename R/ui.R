library(shiny)
library(visNetwork)

ui <- fluidPage(
  titlePanel("Social Network Analyzer"),
  sidebarLayout(
    sidebarPanel(
      textInput("hashtag", "Hashtag", value = "rstats"),
      numericInput("n_tweets", "Number of Tweets", value = 100, min = 1),
      actionButton("analyze", "Analyze"),
      tags$head(
        tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
      )
    ),
    mainPanel(
      visNetworkOutput("network_plot"),
      tableOutput("centralities_table")
    )
  )
)
