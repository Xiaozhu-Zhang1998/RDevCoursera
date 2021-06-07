library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Style"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       selectInput("school", "Choose the school", choices = c("UCLA", "Duke")),
       
       textOutput("counter"),
       
       tags$style("body{background-color: linen; color: brown}"),
       tags$style(".col-sm-4{font-style: oblique; border-style: solid}"),
       tags$style(".col-sm-8{border-style: solid}")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       tabsetPanel(
         tabPanel("Slogan", br(), textOutput("p1")),
         tabPanel("Gallary", uiOutput("p2"))
       )
    )
  )
))
