library(shiny)
library(shinydashboard)
library(plotly)
library(datasets)

shinyUI(dashboardPage(

    dashboardHeader(title = "Demo shinydashboard package", titleWidth = 600, disable = FALSE),
    
    dashboardSidebar(
        sidebarMenu(
            menuItem(text = "About", tabName = "about", icon = icon("clipboard")),
            menuItem(text = "Data", tabName = "data", icon = icon("database"), badgeLabel = "new", badgeColor = "green"),
            menuItem(text = "Link to code files", href = "https://www.google.com", icon = icon("code")),
            menuItem("Chart", icon = icon("line-chart"), 
                     menuSubItem('chartmenusub1', tabName = "chart1", icon = icon("line-chart")),
                     menuSubItem("chartmenushb2", tabName = "chart2", icon = icon("line-chart"))),
            menuItem(text = "Box", tabName = "box", icon = icon("check")),
            menuItem(text = "InfoBox", tabName = "IB")
        )
    ),
    
    dashboardBody(
        tabItems(
            tabItem(tabName = "about", p("This example app...")),
            tabItem(tabName = "data", dataTableOutput("mydatatable")),
            tabItem(tabName = "box", 
                    fluidRow(
                        box(title = "Box with a plot", plotlyOutput("plot1", height = 250), 
                            status = "danger", solidHeader = T, collapsible = T),
                        
                        # Visit status options as follows
                        # https://rstudio.github.io/shinydashboard/appearance.html#statuses-and-colors
                        
                        box(title = "Box with a plot", plotlyOutput("plot2", height = 250))
                    ),
                    fluidRow(
                        box(title = "Box with datatable", tableOutput("data"), width = 8,
                            solidHeader = T, status = "success", background = "red"),
                        box(title = "Box with inputwidget", uiOutput("inputwidget"), width = 4,
                            background = "black", solidHeader = T)
                    ),
                    fluidRow(
                        tabBox(id = "tabchart",
                               tabPanel("Tab1", "Tab 1 content"),
                               tabPanel("Tab2", "Tab 2 content"))
                    )),
            
            tabItem(tabName = "IB",
                    fluidRow(
                        infoBoxOutput("min_", width = 3), infoBoxOutput("max_", width = 3),
                        infoBoxOutput("sd_", width = 3), infoBoxOutput("mean_", width = 3)
                    ),
                    fluidRow(
                        infoBoxOutput("median_", width = 6)
                    ),
                    fluidRow(
                        infoBoxOutput("inline", tags$style("#inline {height:75px; line-height:75px; padding-top:0px; padding-bottom:0px; width:400px;}"))
                    )
                    )
        )
    )
    
))
