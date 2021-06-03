library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Zip / Unizip files"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       fileInput("file", "Upload zip file", accept = ".zip"),
       actionButton("unzip", "Unzip files")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       tableOutput("filedf"),
       tableOutput("zipped")
    )
  )
))
