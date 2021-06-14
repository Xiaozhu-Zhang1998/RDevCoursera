library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$dataname <- renderText({
    paste("Structure of the dataset", input$dataset)
  })
  
  output$structure <- renderPrint({
    str(get(input$dataset))
  })
  
  output$observation <- renderText({
    input$act
    if(input$act == 0)
      return()
    else
      isolate(paste("First", input$obs, "observations of the dataset", input$dataset))
  })
  
  output$view <- renderTable({
    input$act
    if(input$act == 0)
      return()
    else
      isolate(head(get(input$dataset), n = input$obs))
  })
  
})
