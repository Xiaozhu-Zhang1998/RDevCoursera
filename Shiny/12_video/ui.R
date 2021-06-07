

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Watch a video!"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       p("Let's see Monica and Ross!"),
       p("Powered by:"),
       tags$img(src = "rstudio-og-fb.jpg", height = 100, width = 200)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h3("Go Routine!"), 
      uiOutput("video")
    )
  )
))
