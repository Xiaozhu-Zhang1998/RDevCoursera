library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Demo - interative plots - remove outliers"),

    plotOutput("boxplot", brush = "plot_brush_"),
    
    fixedRow(
        column(width = 5, tags$b(tags$i("Actual Dataset")), tableOutput("data1")),
        column(width = 5, tags$b(tags$i("Updated Dataset")), tableOutput("data2"))
    )
    
))
