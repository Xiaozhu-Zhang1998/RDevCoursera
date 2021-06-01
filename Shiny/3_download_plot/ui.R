library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Download base plot in Shiny - an example"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       selectInput("var1", "Select the X variable", 
                   choices = c("Sepal.Length" = 1, "Sepal.Width" = 2, "Petal.Length" = 3, "Petal.Width" = 4)),
       selectInput("var2", "Select the Y variable", 
                   choices = c("Sepal.Length" = 1, "Sepal.Width" = 2, "Petal.Length" = 3, "Petal.Width" = 4)),
       radioButtons("var3", "Select the file type", choices = list("png", "pdf"))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("plot"),
       downloadButton("down", "Download the plot")
    )
  )
))
