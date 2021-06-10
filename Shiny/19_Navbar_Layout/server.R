library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$data <- renderTable({
    mtcars
  })
  
  output$plot <- renderPlot({
    ggplot(data = mtcars, aes(x = mpg)) + geom_histogram(bins = as.numeric(input$b))
  })
  
  output$summary <- renderPrint({
    summary(mtcars)
  })

  
})
