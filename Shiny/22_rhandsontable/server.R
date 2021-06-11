library(shiny)
library(rhandsontable)

# Creating dataset
a = sample(1:10, replace = TRUE)
b = sample(1:10, replace = TRUE)
c = a + b
df1 = data.frame(a = a, b = b, c = c)

shinyServer(function(input, output) {
  
  output$table1 <- renderTable({
    df1
  })
  
  
  output$table <- renderRHandsontable({
    rhandsontable(df1)
  })
  
  observeEvent(input$saveBtn, 
               write.csv(hot_to_r(input$table), file = "MyData.csv", row.names = FALSE)
               )
  
  observeEvent(input$table$changes$changes, {
    xi = input$table$changes$changes[[1]][[1]]
    yi = input$table$changes$changes[[1]][[2]]
    old = input$table$changes$changes[[1]][[3]]
    new = input$table$changes$changes[[1]][[4]]
    
    output$changeinfo <- renderPrint({
      list(paste("Row index of cell which is changed", xi),
           paste("Column index of cell which is changed", yi),
           paste("Old value of the cell", old),
           paste("New value of the cell", new))
    })
  })
  
  
})
