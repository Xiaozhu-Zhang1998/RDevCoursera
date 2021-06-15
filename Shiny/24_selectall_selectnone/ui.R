library(shiny)

shinyUI(fluidPage(

    fluidRow(
        column(4, 
               list(
                   h5("Demo example - select all"),
                   hr(),
                   selectInput("s1", "Select Box 1", choices = choices, multiple = T, selected = "choice1"),
                   verbatimTextOutput("selected")
               )),
        
        column(4,
               list(
                   h5("Demo example - select all/none"),
                   hr(),
                   checkboxInput("all", "Select All/None", value = TRUE),
                   checkboxGroupInput('mtcars', 'mtcars column variables', myChoices)
               ))
    )
    
))
