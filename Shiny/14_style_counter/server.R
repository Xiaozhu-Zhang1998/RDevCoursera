library(shiny)

shinyServer(function(input, output) {
   
  output$p1 <- renderText({
    if(input$school == "UCLA")
      return("Go Bruins!")
    else
      return("Go Blue Devils!")
  })
  
  output$p2 <- renderUI({
    if(input$school == "UCLA")
      tags$img(src = "ucla.jpeg", height = 400, width = 600)
    else
      tags$img(src = "duke.jpeg", height = 400, width = 600)
  })
  
  output$counter <- renderText({
    if(!file.exists("counter.Rdata"))
      counter <- 0
    else
      load(file = "counter.Rdata")
    counter <- counter + 1
    save(counter, file = "counter.Rdata")
    paste0("Hits: ", counter)
  })
  
})
