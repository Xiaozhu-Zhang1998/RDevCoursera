
library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$dataname <- renderText({
    paste("Structure of the dataset", input$dataset)
  })
  
  output$observation <- renderText({
    paste("First", input$obs, "observations of the dataset", input$dataset)
  })
  
  output$structure <- renderPrint({
    str(get(input$dataset))
  })
  
  output$view <- renderTable({
    head(get(input$dataset), n = input$obs)
  })
  
})
