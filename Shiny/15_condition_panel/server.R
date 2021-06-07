library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$varx <- renderUI({
    selectInput("variablex", "Select the X variable", choices = names(get(input$dataset)))
  })
  
  output$vary <- renderUI({
    selectInput("variabley", "Select the Y variable", choices = names(get(input$dataset)))
  })
  
  output$pdata <- renderPrint({
    get(input$dataset)
  })
  
  output$structure <- renderPrint({
    str(get(input$dataset))
  })
  
  output$summary <- renderPrint({
    summary(get(input$dataset))
  })
  
  output$plot <- renderPlot({
    ggplot(data = get(input$dataset), aes_string(input$variablex, input$variabley)) + geom_point()
  })
  
})
