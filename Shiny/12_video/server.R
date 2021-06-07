library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$video <- renderUI({
    
    tags$video(src = 'Routine.mp4', type = 'video/mp4', width = '600px', height = '400px', controls = "controls")
    
  })
  
})
