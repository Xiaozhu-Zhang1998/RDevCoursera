library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
   
  counter <- reactiveValues(countervalue = 0)
  
  observeEvent(input$add1, {
    counter$countervalue <- counter$countervalue + 1
  })
  
  observeEvent(input$sub1, {
    counter$countervalue <- counter$countervalue - 1
  })
  
  observeEvent(input$reset, {
    counter$countervalue <- 0
  })
  
  output$count <- renderText({
    paste("Counter Value is", counter$countervalue)
  })
  
  ##
  
  values <- reactiveValues(uno = 0, dos = 0, tres = 0)
  observeEvent(input$buttonuno, {
    values$uno <- 1
    values$dos <- 0
    values$tres <- 0
  })
  observeEvent(input$buttondos, {
    values$uno <- 0
    values$dos <- 1
    values$tres <- 0
  })
  observeEvent(input$buttontres, {
    values$uno <- 0
    values$dos <- 0
    values$tres <- 1
  })
  output$display <- renderText({
    if(values$uno)
      paste("Button # 1 selected")
    else if(values$dos)
      paste("Button # 2 selected")
    else if(values$tres)
      paste("Button # 3 selected")
    else
      return()
      
  })
  
  
})
