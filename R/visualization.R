library(shiny)
library(igraph)
library(visNetwork)

ui <- fluidPage(
  titlePanel("Social Network Analyzer"),
  sidebarLayout(
    sidebarPanel(
      textInput("hashtag", "Hashtag", value = "rstats"),
      numericInput("n_tweets", "Number of Tweets", value = 100, min = 1),
      actionButton("analyze", "Analyze")
    ),
    mainPanel(
      visNetworkOutput("network_plot"),
      tableOutput("centralities_table")
    )
  )
)

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

shinyApp(ui = ui, server = server)
