library(shiny)

shinyUI(fluidPage(
 titlePanel("Demostration of textInput widget"),
 
 sidebarLayout( 
   #position = "right",
   sidebarPanel(("Enter the personal information"),
                textInput("name", "Enter your name", ""),
                textInput("age", "Enter your age", ""),
                radioButtons("gender", "Select the gender", 
                             list("Male", "Female"), "")),
   
   mainPanel(("Personal information"),
             textOutput("myname"),
             textOutput("myage"),
             textOutput("mygender"))
 )
  
))