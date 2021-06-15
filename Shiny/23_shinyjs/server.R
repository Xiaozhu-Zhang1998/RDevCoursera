library(shiny)
library(shinyjs)
library(data.table) # to use fread function for faster data read from URL

shinyServer(function(input, output) {
    
    delay(60000, hide("t"))
    
    observeEvent(input$alert,
                 alert("This is an alert message."))
    
    observeEvent(input$showh,
                 show("txt"))
    
    observeEvent(input$hideh,
                 hide("txt"))
    
    observeEvent(input$shows,
                 show("slider"))
    
    observeEvent(input$hides,
                 hide("slider"))
    
    observeEvent(input$disable,
                 disable("able"))
    
    observeEvent(input$enable,
                 enable("able"))
    
    output$plot <- renderPlot({
        plot(mtcars$mpg)
    })
    
    observeEvent(input$button,
                 toggle("plot"))
    
    
    # New Features Below!
    URL <- "http://archive.ics.uci.edu/ml/machine-learning-databases/adult/adult.data"
    mydata <- fread(URL, sep = ",", showProgress = FALSE) # reading data from URL
    
    ## hide the text message and enable the save button only when data is read from URL
    if(is.null(mydata))
        return()
    else
        hide("p1"); enable("save")
    
    ## On click on the save button, read dataset from uci URL and write to working directly
    observeEvent(input$save, {
        starttime = Sys.time()
        write.csv(mydata, "data.csv", row.names = FALSE)
        endtime = Sys.time()
        timelapse = endtime - starttime
        ms = timelapse * 1000
        delay(ms, alert("File saved, thanks for using the app!"))
    })

})
