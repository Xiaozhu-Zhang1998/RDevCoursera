library(shiny)

shinyServer(function(input, output) {
    
    output$mydatatable <- renderDataTable({
        mtcars
    })

})
