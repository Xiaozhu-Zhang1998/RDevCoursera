library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$summary <- renderPrint({
    summary(iris)
  })
  
  output$str <- renderPrint({
    str(iris)
  })
   
  output$data <- renderTable({
    col <- as.numeric(input$var)
    iris[col]
  })
  
  output$myhist <- renderPlot({
     col <- as.numeric(input$var)
     hist(iris[,col], breaks = seq(0, max(iris[,col], l = input$bins + 1)), col = input$color,
          main = "Histogram of iris dataset", xlab = names(iris[col]))
   })
  
})
