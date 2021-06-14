library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Demonstration of submitButton() in shiny"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput("dataset", "Choose a dataset:", 
                  choices = c("iris", "pressure", "mtcars")),
      numericInput("obs", "Number of observations:", 6),
      submitButton("Update!")
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
