library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$table1 <- renderTable({
    mtcars
  })
  
  output$summary1 <- renderPrint({
    summary(mtcars)
  })
  
  output$plot <- renderPlot({
    ggplot(data = mtcars, aes(x = mpg)) + geom_histogram(bins = as.numeric(input$n))
  })
  
  
})
