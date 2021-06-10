library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(session, input, output) {
   
  observeEvent(
    input$Year,
    updateSelectInput(session, "Month", "Month", choices = data$Month[data$Year == input$Year])
  )
  
  observeEvent(
    input$Month,
    updateSelectInput(session, "Name", "Name", choices = data$Name[data$Year == input$Year & data$Month == input$Month])
  )
  
  output$dataset <- renderTable({
    data
  })

})
