library(shiny)
library(shinydashboard)

shinyUI(dashboardPage(

    dashboardHeader(title = "Demo shinydashboard package", titleWidth = 600, disable = FALSE),
    
    dashboardSidebar(
        sidebarMenu(
            menuItem(text = "About", tabName = "about", icon = icon("clipboard")),
            menuItem(text = "Data", tabName = "data", icon = icon("database"), badgeLabel = "new", badgeColor = "green"),
            menuItem(text = "Link to code files", href = "https://www.google.com", icon = icon("code"))
        )
    ),
    
    dashboardBody(
        tabItems(
            tabItem(tabName = "about", p("This example app...")),
            tabItem(tabName = "data", dataTableOutput("mydatatable"))
        )
    )
    
))
