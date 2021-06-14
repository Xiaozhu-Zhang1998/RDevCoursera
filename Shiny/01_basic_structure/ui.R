library(shiny)

shinyUI(fluidPage(
 titlePanel("Demostration"),
 
 sidebarLayout( 
   #position = "right",
   sidebarPanel(h4("Enter the personal information"),
                textInput("name", "Enter your name", ""),
                textInput("age", "Enter your age", ""),
                radioButtons("gender", "Select the gender", 
                             list("Male", "Female"), ""),
                sliderInput("schoolyear", "Choose your start year and end year of college",
                            min = 2000, max = 2021, value = c(2000, 2004)),
                sliderInput("salary", "Select your expected salary per month",
                            min = 3000, max = 10000, value = 5000, animate = T, step = 100),
                selectInput("statenames", "Select the states of your branches", 
                            c("California", "Florida", "Texas", "New York", "Arizona"),
                            selected = "Texas", multiple = TRUE)
                ),
   
   mainPanel(h4("Personal information"),
             textOutput("name"),
             textOutput("age"),
             textOutput("gender"),
             textOutput("schoolyear"),
             textOutput("salary"),
             textOutput("state")
             )
             
 )
  
))