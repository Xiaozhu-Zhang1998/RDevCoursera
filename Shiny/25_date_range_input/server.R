library(shiny)

shinyServer(function(input, output, session) {

    output$seldate <- renderText({
       paste("Selected Date is ", format(input$date, "%B %d, %Y"))
    })
    
    output$startdate <- renderText({
        as.character(input$daterange[1])
    })
    
    output$enddate <- renderText({
        as.character(input$daterange[2])
    })
    
    output$range <- renderText({
        paste("Selected date range is", input$daterange[1], "to", input$daterange[2])
    })
    
    output$subdata <- renderTable({
        s <- subset(mydf, mydf$Date >= input$daterange[1] & mydf$Date <= input$daterange[2])
        table(s$Status)
    })
    
    output$startdate1 <- renderText({
        as.character(input$daterange1[1])
    })
    
    output$enddate1 <- renderText({
        as.character(input$daterange1[2])
    })
    
    output$range1 <- renderText({
        paste("Selected date range is", input$daterange1[1], "to", input$daterange1[2])
    })
    
    output$subdata1 <- renderTable({
        s <- subset(dates, dates$Date >= input$daterange1[1] & dates$Date <= input$daterange1[2])
        table(s$Status)
    })
    
    observeEvent(input$button,
                 updateDateInput(session, "inDate", value = input$inDate + 7))
    
    observeEvent(input$reset,
                 updateDateInput(session, "inDate", value = Sys.Date()))
    
})
