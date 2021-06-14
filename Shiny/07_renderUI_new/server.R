library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$tabs <- renderUI({
    Tabs <- lapply(paste("tab no.", 1:input$n, sep = " "), tabPanel)
    do.call(tabsetPanel, Tabs)
  })
  
})
