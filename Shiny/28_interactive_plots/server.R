library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {

    output$graph <- renderPlot({
        ggplot(data = mtcars, aes(x = mpg, y = hp)) +
            geom_point()
    })
    
    output$data <- renderTable({
        mtcars
    })
    
    output$data_brush <- renderTable({
        n = nrow(brushedPoints(mtcars, input$plot_brush))
        if(n == 0)
            return()
        else
            brushedPoints(mtcars, input$plot_brush)
    })

})
