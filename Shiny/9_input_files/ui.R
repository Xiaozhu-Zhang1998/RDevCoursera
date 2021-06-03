library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("File Input"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       fileInput("file", "Upload the file", multiple = TRUE),
       helpText("Default max file size is 5MB"),
       tags$hr(),
       h5(helpText("Select the read.table parameters below")),
       checkboxInput("header", "Header", FALSE),
       checkboxInput("stringsAsFactors", "stringAsFactors", FALSE),
       br(),
       radioButtons('sep', 'Separator', 
                    choices = c(Comma = ',', Semicolon = ';', Tab = '\t', Space = ' '),
                    selected = ','),
       uiOutput("selectfile")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       uiOutput("tb")
    )
  )
))
