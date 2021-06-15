library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$plot <- renderPlot({
    if(input$color == "None")
      p <- ggplot(data = dataset[1:input$sampleSize,], aes_string(input$x, input$y)) +
        geom_point()
    else
      p <- ggplot(data = dataset[1:input$sampleSize,], aes_string(input$x, input$y, col = input$color)) + 
        geom_point()
    
    if(input$jitter)
      p <- p + geom_jitter()
    if(input$smooth)
      p <- p + geom_smooth()
    
    
    p <- p + facet_grid(as.formula(paste(input$facet_row, "~", input$facet_col)))
    
    return(p)
  })
  
 
  
})
