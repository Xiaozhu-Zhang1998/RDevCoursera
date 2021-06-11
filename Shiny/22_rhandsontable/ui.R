library(shiny)
library(rhandsontable)


shinyUI(fluidPage(
  
  fluidRow(
    titlePanel("Demo rhandsontable"),
    hr(),
    column(4,
           helpText("non-editable table"),
           tableOutput("table1")),
    column(4,
           helpText("editable table"),
           rHandsontableOutput("table"),
           br(),
           actionButton("saveBtn", "Save")),
    column(4,
           verbatimTextOutput("changeinfo"), offset = 1)
  )
  
))
