library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Dynamic user interface - RenderUI"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       selectInput("data1", label = "Select the Dataset of your choice",
                   choices = c("iris", "mtcars", "trees")),
       br(),
       uiOutput("vx"), # vx is coming from renderUI in server.r
       br(),
       uiOutput("vy")  # vy is coming from renderUI in server.r 
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("p")
    )
  )
))
