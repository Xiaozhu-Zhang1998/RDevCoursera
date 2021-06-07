library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Embed PDF"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       p("Embed a local pdf, or from web URL.")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       tabsetPanel(
         tabPanel("Reference", 
                  tags$iframe(style = "height:400px; width:100%; scrolling = yes",
                              src = "https://cran.r-project.org/doc/manuals/r-release/R-intro.pdf")),
         tabPanel("Cheet Sheet",
                  tags$iframe(style = "height:400px; width:100%; scrolling = yes",
                              src = "cheatsheet.pdf"))
       )
    )
  )
))
