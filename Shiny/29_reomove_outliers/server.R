library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    mt <- reactiveValues(data = mtcars1)
    
    output$boxplot <- renderPlot({
        ggplot(mt$data, aes(cyl, mpg)) + geom_boxplot(outlier.colour = "red") + coord_flip()
    })
    
    output$data1 <- renderTable({
        mtcars1
    })
    
    output$data2 <- renderTable({
        mt$data
    })
    
    observe({
        df <- brushedPoints(mt$data, brush = input$plot_brush_, allRows = TRUE)
        mt$data <- df[df$selected_ == FALSE, ]
    })
})
