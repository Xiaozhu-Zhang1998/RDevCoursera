library(shiny)
library(shinydashboard)
library(plotly)
library(datasets)

shinyServer(function(input, output, session) {
    
    output$mydatatable <- renderDataTable({
        mtcars
    })
    
    output$data <- renderTable({
      head(mtcars)
    })
    
    output$plot1 <- renderPlotly({
      plot_ly(data = mtcars,
              x =~ wt,
              y =~ mpg,
              type = 'scatter',
              mode = 'markers')
    })
    
    output$plot2 <- renderPlotly({
      plot_ly(data = mtcars,
              x =~ mpg,
              type =~ "histogram")
    })
    
    output$inputwidget <- renderUI({
      selectInput("in", "Select a variable", choices = names(mtcars))
    })
    
    output$min_ <- renderInfoBox({
      infoBox(title = "Minm", value = min(s), subtitle = "minimum value in dataset", fill = TRUE)
    })
    
    output$max_ <- renderInfoBox({
      infoBox(title = "Maxm", value = max(s), subtitle = "maximum value in dataset", fill = TRUE, color = "yellow")
    })
    
    output$sd_ <- renderInfoBox({
      infoBox(title = "SD", value = round(sd(s), 2), subtitle = "Standard Deviation", icon = icon("arrow-up"))
    })
    
    output$mean_ <- renderInfoBox({
      infoBox(title = "Mean", value = mean(s), subtitle = "Mean of dataset values", icon = icon("angle-double-right"))
    })
    
    output$median_ <- renderInfoBox({
      infoBox(title = tags$b("Median"), value = median(s), subtitle = tags$i("Median of dataset"), icon = icon("angle-double-right"))
    })
    
    output$min__ <- renderValueBox({
      valueBox(value = min(s), subtitle = "minimum value in dataset")
    })
    
    output$max__ <- renderValueBox({
      valueBox(value = max(s), subtitle = "maximm value in dataset")
    })
    
    output$sd__ <- renderValueBox({
      valueBox(value = round(sd(s), 2), subtitle = "Standard Deviation", icon = icon("arrow-up"), color = "yellow")
    })
    
    output$mean__ <- renderValueBox({
      valueBox(value = mean(s), subtitle = "Mean of dataset values", icon = icon("angle-double-right"), color = "purple")
    })
    
    output$median__ <- renderValueBox({
      valueBox(value = median(s), subtitle = tags$i("Median of dataset"), icon = icon("angle-double-right"))
    })
    
    output$orders__ <- renderValueBox({
      valueBox(value = 20, subtitle = "New Orders", icon = icon("flag"))
    })
    
    output$approved__ <- renderValueBox({
      valueBox(value = "80%", subtitle = "Approval", icon = icon("brush"))
    })

})
