library(shiny)
library(ggplot2)


# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Diamond Explorer"),
  
  fluidRow(
    column(4,
           sliderInput("sampleSize", 'Sample Size',
                       min = 1, max = nrow(dataset), value = min(1000, nrow(dataset)),
                       step = 500, round = 0),
           br(),
           checkboxInput("jitter", "Jitter"),
           checkboxInput("smooth", "Smooth")
           ),
    column(4,
           selectInput("x", "X", names(dataset)),
           selectInput("y", "Y", names(dataset), names(dataset)[[2]]),
           selectInput("color", "Color", c("None", names(dataset)))
           ),
    column(4,
           selectInput("facet_row", "Facet Row", c(None = ".", names(dataset))),
           selectInput("facet_col", "Facet Column", c(None = ".", names(dataset)))
           )
  ),
  br(),
  plotOutput("plot")
  
  
  )
)
