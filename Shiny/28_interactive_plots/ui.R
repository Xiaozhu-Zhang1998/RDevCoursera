library(shiny)
library(ggplot2)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Demo - brushedPoints - Interactive plots"),
    
    plotOutput("graph", brush = "plot_brush"),
    
    fluidRow(
        column(width = 6, tags$b(tags$i("Actual Dataset")), tableOutput("data")),
        column(width = 6, tags$b(tags$i("Rows corresponding to datapoints under brush")),
               tableOutput("data_brush"))
    )
    
))
