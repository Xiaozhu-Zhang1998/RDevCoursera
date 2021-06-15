library(shiny)
library(rhandsontable)


shinyUI(fluidPage(
  
  fluidRow(
    titlePanel("Demo rhandsontable"),
    hr(),
    column(3,
           helpText("non-editable table"),
           tableOutput("table1")),
    column(3,
           helpText("editable table"),
           rHandsontableOutput("table"),
           br(),
           actionButton("saveBtn", "Save")),
    column(3,
           verbatimTextOutput("changeinfo")),
    column(3,
           plotOutput("plot"))
  )
  
))
