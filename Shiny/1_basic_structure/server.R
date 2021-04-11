library(shiny)

shinyServer(function(input, output){
  
  output$name <- renderText(paste0("My name is ", input$name))
  output$age <- renderText(paste0("I am ", input$age, " years old"))
  output$gender <- renderText(ifelse(input$gender == "Male",
                                     "I am a boy", "I am a girl"))
  output$schoolyear <- renderText(paste0("I started my college in ", 
                                         input$schoolyear[1], " and finished in ",
                                         input$schoolyear[2]))
  output$salary <- renderText(paste0("My expected salary is $", input$salary, " a month"))
})