library(shiny)

# Define UI for application that draws a histogram
shinyUI(navbarPage(
  title = "Demo Shiny Navbar Layout",
  
  tabPanel("About Page",
           h4("This app uses navbar for layout & mtcars dataset for demo")),
  
  tabPanel("Data Page", tableOutput("data")),
  
  tabPanel("Widgts & Sidebar",
           sidebarLayout(
             sidebarPanel(
               sliderInput("b", "Select no. of Bins", min = 5, max = 25, value = 10)
             ),
             mainPanel(
               plotOutput("plot")
             )
           )),
  
  navbarMenu("Menu Options", 
             tabPanel("Menu item A - Summary stats", verbatimTextOutput("summary")),
             tabPanel("Menu item B - Link to code",
                      h4(HTML(paste("Thanks for watching the video. Reference code available at the following", a(href="www.google.com", "link"), "."))),
                      h4(HTML(paste("In case you have questions", a(href = "mailto:xzzhang1998@gmail.com", "email me"), ".")))
                      )
             )
  
))
