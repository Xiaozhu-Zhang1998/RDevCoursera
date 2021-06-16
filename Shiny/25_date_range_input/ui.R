library(shiny)

shinyUI(fluidPage(

    fluidRow(
        column(3, list(
            h5("R Shiny Demo - dataInput"),
            hr(),
            
            dateInput("date", "Date Input", 
                      value = Sys.Date(), min = Sys.Date() - 10, max = Sys.Date() + 10,
                      width = "100px", format = "mm/dd/yyyy"),
            textOutput("seldate")
        )),
        
        column(3, list(
            h5("R Shiny Demo - dataRangeInput"),
            hr(),
            dateRangeInput("daterange", "Select the date range",
                           start = min(mydf$Date), end = max(mydf$Date),
                           min = min(mydf$Date), max = max(mydf$Date),
                           format = "mm/dd/yyyy", separator = '-'),
            textOutput("startdate"),
            textOutput("enddate"),
            textOutput("range"),
            tableOutput("subdata")
        )),
        
        column(3, list(
            h5("R Shiny Demo - read from csv file"),
            hr(),
            dateRangeInput("daterange1", "Select the date range",
                           start = min(dates$Date), end = max(dates$Date),
                           min = min(dates$Date), max = max(dates$Date),
                           format = "mm/dd/yyyy", separator = '-'),
            textOutput("startdate1"),
            textOutput("enddate1"),
            textOutput("range1"),
            tableOutput("subdata1")
        ))
    ),
    
    fluidRow(
        column(12, list(
            h5("Demo - updateDateInput() - Update the date and reset it"),
            hr(),
            
            actionButton("button", "Date + 7"),
            actionButton("reset", "Reset"),
            dateInput("inDate", "Input Date", value = Sys.Date())
        ))
    )
    
))
