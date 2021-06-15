library(shiny)

shinyServer(function(input, output, session) {
    
    observe({
        if("Select All" %in% input$s1)
            selected_choices <- choices[-1]
        else
            selected_choices <- input$s1
        updateSelectInput(session, "s1", selected = selected_choices)
    })
    
    output$selected <- renderText({
        paste(input$s1, collapse = ", ")
    })
    
    observe({
        updateCheckboxGroupInput(
            session, 'mtcars', choices = myChoices,
            selected = if(input$all) myChoices
        )
    })

})
