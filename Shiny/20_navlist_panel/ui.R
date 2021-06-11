library(shiny)
library(datasets)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Demo navlist panel navigation layout"),
  
  navlistPanel(
    widths = c(4, 8),
    "Data",
    tabPanel("About", h3("This is the first tab or page")),
    tabPanel("Data Table",
             tableOutput("table1"),
             h3("This is the first tab or page")),
    tabPanel("Data Summary", verbatimTextOutput("summary1")),
    "Plots",
    tabPanel("Scatter Plot", h3("Can have widgets and plots")),
    tabPanel("Histogram", 
             sliderInput("n", "Bins", min = 5, max = 25, value = 15),
             plotOutput("plot"))
  )
  
))
