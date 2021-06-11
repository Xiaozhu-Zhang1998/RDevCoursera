library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$table <- renderTable({
    get(input$dataset)[1:as.numeric(input$n),]
  })
  
  output$summary <- renderPrint({
    summary(get(input$dataset)[1:as.numeric(input$n),])
  })
  
})
