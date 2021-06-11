library(shiny)
library(shinythemes)

shinyUI(fluidPage(
  
  theme = shinytheme("sandstone"),
  themeSelector(),
  
  navbarPage(
    title = "Demo - Shiny themes",
    id = "nav",
    tabPanel("Data", value = "Data",
             sidebarLayout(
               sidebarPanel(
                 selectInput("dataset", "Select the dataset", 
                             choices = c("mtcars", "airquality", "iris")),
                 tags$hr(),
                 sliderInput("n", "Select no. of data rows", min = 2, max = 10, value = 6),
                 tags$hr(),
                 actionButton("button", "ActionButton"),
                 tags$hr(),
                 radioButtons("c", "Radiobuttons", c("Yes", "No"))
               ),
               mainPanel(
                 tabsetPanel(
                   tabPanel("Dataset", tableOutput("table")),
                   tabPanel("Summary Stats", verbatimTextOutput("summary"))
                 )
               )
             )),
    tabPanel("Plots", value = "Plots")
  )
  
  
))
