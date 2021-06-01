library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Demonstration of submitButton() in shiny"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       textInput("text1", "Enter your first name"),
       textInput("text2", "Enter your last name"),
       submitButton("Update!"),
       p("Click on the Update button to display the first and last name entered by the user. Here the reactiveness of the input widget is controlled by submitButton")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       textOutput("txt1"),
       textOutput("txt2")
    )
  )
))
