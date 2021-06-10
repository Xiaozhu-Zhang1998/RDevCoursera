library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Demo updateselectInput() and also observeEvent()"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       selectInput("Year", "Year", choices = unique(data$Year)),
       selectInput("Month", "Month", choices = "", selected = ""),
       selectInput("Name", "Name", choices = "", selected = ""),
       tableOutput("dataset")
    ),
    
    mainPanel()
  )
))
