library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Dynamically creating the tabs based on inputs"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       numericInput("n", "Enter the number  of tabs needed", 1)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       uiOutput("tabs")
    )
  )
))
