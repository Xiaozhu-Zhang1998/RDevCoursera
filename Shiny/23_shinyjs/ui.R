library(shiny)
library(shinyjs)

shinyUI(fluidPage(
    
    useShinyjs(),

    # Application title
    titlePanel("shinyjs - hide, show, toggle, hidden, alert, delay, enable, disable elements in R Shiny"),

    h4("Add common javascript capabilities to shiny app without knowing javascript"),
    
    hr(),
    
    tags$div(id = "t",
             style = "color:green",
             list(h4("Hello and welcome to this demo! This is a welcome message. I will disappear in 60 seconds."),
                  hr())),
    
    fluidRow(
        column(width = 3,
               list(actionButton("alert", "Click to alert"))
        ),
        column(width = 3, style = "outline-style: groove; outline-width: thin;",
               list(actionButton("hides", "Hide Slider"),
                    actionButton("shows", "Show Slider"),
                    sliderInput("slider", "Slider", min = 0, max = 10, value = 5))

        ),
        column(width = 3,
               list(actionButton("showh", "Show hidden text"),
                    actionButton("hideh", "Hide text"),
                    br(),
                    hidden(tags$div(id = "txt",
                                    list(helpText("This is a help text. You can hide me."))))
                    )
        ),
        column(width = 3, style = "outline-style: groove; outline-width: thin;",
               list(actionButton("disable", "Disable"),
                    actionButton("enable", "Enable"),
                    sliderInput("able", "slider", min = 0, max = 10, value = 5))
               
        )
    ),
    
    fluidRow(
        column(3,
               list(hr(),
                    actionButton("button", "Click and toggle plot"),
                    plotOutput("plot"))),
        column(3,
               list(hr(),
                   tags$div(id = "p1", h4("Reading the data from web..."), stype = "color:brown;"),
                   disabled(actionButton("save", "Save Dataset"))
               ))
    )
))
