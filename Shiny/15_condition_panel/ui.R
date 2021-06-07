library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Conditional panel"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    
    sidebarPanel(
      conditionalPanel(condition = "input.tabselected == 1", h4("Demo conditionalPanel()")),
      conditionalPanel(condition = "input.tabselected == 2", 
                       selectInput("dataset", "Select the desired dataset", 
                                   choices = c("iris", "airquality", "mtcars"),
                                   selected = 'mtcars'),
                       radioButtons("choice", "Choose an option",
                                    choices = c("Dataset" = 1, "Structure" = 2, "Summary" = 3))),
      conditionalPanel(condition = "input.tabselected == 3", uiOutput("varx"), uiOutput("vary"))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(
        tabPanel("About", value = 1, helpText("...")),
        tabPanel("Data", value = 2, 
                   conditionalPanel(condition = "input.choice == 1", verbatimTextOutput("pdata")),
                   conditionalPanel(condition = "input.choice == 2", verbatimTextOutput("structure")),
                   conditionalPanel(condition = "input.choice == 3", verbatimTextOutput("summary"))),
        tabPanel("Plot", value = 3, plotOutput("plot")),
        id = "tabselected"
      )
       
    ))
  )
)
