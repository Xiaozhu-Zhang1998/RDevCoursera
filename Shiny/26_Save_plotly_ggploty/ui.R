library(shiny)
library(ggplot2)
library(plotly)
library(webshot)

shinyUI(fluidPage(

    titlePanel("Demo - Save plotly & ggplotly graphs to local machine in Shiny"),
    tags$li("We will use the export function"),
    tags$li("Webshot pacakge along with shiny and plotly will be needed"),
    
    radioButtons("format", "Download file format", choices = c("jpeg", "png", "pdf"),
                 selected = "jpeg", inline = TRUE),
    
    uiOutput("selects1"),
    uiOutput("selects2"),
    br(),
    
    actionButton("savea", "Save the plotly plot"),
    actionButton("saveb", "Save the ggplotly plot"),
    hr(),
    
    plotlyOutput("plot1", width = 600, height = 350, inline = TRUE),
    plotlyOutput("plot2", width = 600, height = 350, inline = TRUE)

   
))
