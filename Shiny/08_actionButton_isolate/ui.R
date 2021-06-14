library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("A demo of actionButton and isolate in shiny"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput("dataset", "Choose a dataset:",
                  choices = c("iris", "pressure", "mtcars")), 
      numericInput("obs", "Number of observations:", 6),
      br(),
      actionButton("act", "Update"),
      helpText("Click to update the observation of the selected dateset!")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       h4(textOutput("dataname")),
       verbatimTextOutput("structure"),
       h4(textOutput("observation")),
       tableOutput("view")
    )
  )
))
