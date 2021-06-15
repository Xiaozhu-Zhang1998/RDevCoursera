library(shiny)
library(rhandsontable)

# Creating dataset
a <- sample(1:10, replace = TRUE)
b <- sample(1:10, replace = TRUE)
c <- a + b
df = data.frame(a = a, b = b, c = c)

shinyServer(function(input, output) {
  
  datavalues <- reactiveValues(data = df)
  
  output$table1 <- renderTable({
    df
  })
  
  
  output$table <- renderRHandsontable({
    rhandsontable(datavalues$data)
  })
  
  observeEvent(input$saveBtn, 
               write.csv(hot_to_r(input$table), file = "MyData.csv", row.names = FALSE)
               )
  
  observeEvent(input$table$changes$changes, {
    xi <- input$table$changes$changes[[1]][[1]]
    datavalues$data <- hot_to_r(input$table)
    datavalues$data[xi + 1, 3] <- datavalues$data[xi + 1, 1] + datavalues$data[xi + 1, 2]
  })
  
  observeEvent(input$table$changes$changes, {
    xi = input$table$changes$changes[[1]][[1]]
    yi = input$table$changes$changes[[1]][[2]]
    old = input$table$changes$changes[[1]][[3]]
    new = input$table$changes$changes[[1]][[4]]
    
    output$changeinfo <- renderPrint({
      list(paste("Row index of cell which is changed", xi + 1),
           paste("Column index of cell which is changed", yi + 1),
           paste("Old value of the cell", old),
           paste("New value of the cell", new))
    })
  })
  
  output$plot <- renderPlot({
    ggplot2::ggplot(data = datavalues$data, ggplot2::aes(x = c)) + ggplot2::geom_histogram()
  })
  
  
})
