library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel(title = h4("Demonstration of renderPlot() - a histogram", align = "center")),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       selectInput("var", "1. Select the varaible from the iris dataset", 
                   choices = c("Sepal.Length" = 1, "Sepal.Widch" = 2, "Petal.Length" = 3, "Petal.Width" = 4)),
       br(),
       sliderInput("bins", "2. Select the number of BINs for histogram", min = 5, max = 25, value = 15),
       br(),
       radioButtons("color", "3. Select the color of histogram", 
                    choices = c("Green", "Red", "Yellow"), selected = "Green")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(type = "tab", 
                  tabPanel("Summary", verbatimTextOutput("summary")), 
                  tabPanel("Structure", verbatimTextOutput("str")), 
                  tabPanel("Data", tableOutput("data")), 
                  tabPanel("Plot", plotOutput("myhist"))
      )
    )
  )
))
