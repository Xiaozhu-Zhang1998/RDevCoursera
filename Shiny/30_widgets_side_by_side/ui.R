library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    div(style = "display:inline-block; vertical-align: top; padding-left: 30px; width:250px;", sliderInput("var1", label = "Variable A", min = 0, max = 100, step = 10, value = 50)),
    div(style = "display:inline-block; vertical-align: top; padding-left: 30px; width:250px;", selectInput("var2", label = "variable B", choices = names(mtcars))),
    div(style = "display:inline-block; vertical-align: top; padding-left: 30px; width:250px;", textInput("var3", label = "Enter Text")),
    div(style = "display:inline-block; vertical-align: center; padding-left: 2px; width:30px;", actionButton("submit", label = "Go!"))
    
))
