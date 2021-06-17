library(shiny)
library(ggplot2)
library(plotly)
library(webshot)

shinyServer(function(input, output) {

   output$selects1 <- renderUI({
       selectInput("select1", "select variable1", choices = names(data), selected = "V1")
   })
   
   output$selects2 <- renderUI({
       selectInput("select2", "select variable2", choices = names(data), selected = "V1")
   })
   
   ## reactive function for plotly plot
   plot_p <- reactive({
       if(is.null(input$select1) | is.null(input$select2))
           return()
       else{
           p <- plot_ly(data, x =~ get(input$select1), y =~ get(input$select2), mode = 'markers', type = 'scatter')
           return(p)
       }
   })
   
   plot_gg <- reactive({
       if(is.null(input$select1) | is.null(input$select2))
           return()
       else{
           g <- ggplot(data, aes(x = get(input$select1), y = get(input$select2))) + geom_point()
           gg <- ggplotly(g)
           return(gg)
       }
   })
   
   output$plot1 <- renderPlotly({
       if(is.null(plot_p())) return()
       plot_p()
   })
   
   output$plot2 <- renderPlotly({
       if(is.null(plot_gg())) return()
       plot_gg()
   })
   
   observeEvent(input$savea, {
       filename = paste("imagep", input$format, sep = ".")
       export(plot_p(), file.path(getwd(), filename))
   })
   
   observeEvent(input$saveb, {
       filename = paste("imagegg", input$format, sep = ".")
       export(plot_gg(), file.path(getwd(), filename))
   })

})
