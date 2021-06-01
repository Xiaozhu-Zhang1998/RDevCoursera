
library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  x <- reactive({
    iris[,as.numeric(input$var1)]
  }) 
  
  y <- reactive({
    iris[,as.numeric(input$var2)]
  })
  
  output$plot <- renderPlot({
    plot(x(),y())
  })
  
  output$down <- downloadHandler(
    # Specify the file name
    filename = function(){
      # iris.png
      # iris.pdf
      paste("iris", input$var3, sep = ".")
    },
    content = function(file){
      # open the device
      # create the plot
      # close the device
      if(input$var3 == "png") 
        png(file)
      else 
        pdf(file)
      plot(x(), y())
      dev.off()
    }
  )
  
})
