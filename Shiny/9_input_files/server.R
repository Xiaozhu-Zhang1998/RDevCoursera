library(shiny)
# use the code below to increase the file input limit to 9MB
# options(shiny.maxRequestSize = 9 * 1024 ** 2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$filedf <- renderTable({
    if(is.null(input$file)) { return() }
    input$file
  })
  
  output$fileob <- renderPrint({
    if(is.null(input$file)) { return() }
    str(input$file)
  })
  
  output$selectfile <- renderUI({
    if(is.null(input$file)) { return() }
    list(hr(),
         helpText("Select the files for which you need to see data and summary stats"),
         selectInput("Select", "Select", choices = input$file$name))
  })
  
  # data <- reactive({
  #   if(is.null(input$file)){ return() }
    # read.table(file = input$file$datapath[input$file$name == input$Select],
    #            sep = input$sep,
    #            header = input$header,
    #            stringsAsFactors = input$stringsAsFactors)
  # })
  
  output$sum <- renderPrint({
    if(is.null(input$file)) { return() }
    summary(read.table(file = input$file$datapath[input$file$name == input$Select],
                       sep = input$sep,
                       header = input$header,
                       stringsAsFactors = input$stringsAsFactors))
  })
  
  output$table <- renderTable({
    if(is.null(input$file)) { return() }
    read.table(file = input$file$datapath[input$file$name == input$Select],
               sep = input$sep,
               header = input$header,
               stringsAsFactors = input$stringsAsFactors)
  })
  
  output$tb <- renderUI({
    if(is.null(data()))
      h4("Powered by RStudio", tags$img(src = "rstudio-og-fb.jpg", height = 200, width = 400))
    else
      tabsetPanel(tabPanel("About file", tableOutput("filedf")),
                  tabPanel("Object file", verbatimTextOutput("fileob")),
                  tabPanel("Data", tableOutput("table")),
                  tabPanel("Summary", verbatimTextOutput("sum")))
  })
  
})
