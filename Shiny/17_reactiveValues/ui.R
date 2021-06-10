library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  tags$b("Demo of reactiveValues() - An example"),
  br(),
  actionButton("add1", "+ 1"),
  actionButton("sub1", "- 1"),
  actionButton("reset", "set to 0"),
  br(),
  textOutput("count"),
  br(),
  br(),
  
  ##
  actionButton("buttonuno", "Button 1"),
  actionButton("buttondos", "Button 2"),
  actionButton("buttontres", "Button 3"),
  br(),
  textOutput("display")
  
 
))
