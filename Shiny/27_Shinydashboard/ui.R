library(shiny)
library(shinydashboard)
library(plotly)
library(datasets)

title <- tags$a(href = "https://www.google.com", 
                tags$image(src = "logo.png", height = "45", width = "140"),
                "Demo shinydashboard package")

shinyUI(dashboardPage(
    
    skin = "purple",
    # black, purple, green, red, yellow, blue

    dashboardHeader(title = title, titleWidth = 600, disable = FALSE,
                    tags$li(class = "dropdown", tags$a(href = "https://www.facebook.com", icon("facebook"), "Facebook", target = "_blank")),
                    tags$li(class = "dropdown", tags$a(href = "https://www.twitter.com", icon("twitter"), "Twitter", target = "_blank")),
                    tags$li(class = "dropdown", tags$a(href = "https://www.linkedin.com", icon("linkedin"), "LinkedIn", target = "_blank")),
                    tags$li(class = "dropdown", tags$a(href = "https://www.github.com", icon("github"), "GitHub", target = "_blank"))
    ),
    
    dashboardSidebar(
        sidebarMenu(
            menuItem(text = "About", tabName = "about", icon = icon("clipboard")),
            menuItem(text = "Data", tabName = "data", icon = icon("database"), badgeLabel = "new", badgeColor = "green"),
            menuItem(text = "Link to code files", href = "https://www.google.com", icon = icon("code")),
            menuItem("Chart", icon = icon("line-chart"), 
                     menuSubItem('chartmenusub1', tabName = "chart1", icon = icon("line-chart")),
                     menuSubItem("chartmenushb2", tabName = "chart2", icon = icon("line-chart"))),
            menuItem(text = "Box", tabName = "box", icon = icon("check")),
            menuItem(text = "InfoBox", tabName = "IB", icon = icon("tachometer")),
            menuItem(text = "ValueBox", tabName = "VB", icon = icon("tachometer", class = "fa-lg")),
            menuItem(text = "Dashboard1", icon = icon("tachometer", class = "fa-rotate-90")),
            menuItem(text = "Dashboard2", icon = icon("cog", class = "fa-spin")),
            menuItem(text = "Dashboard3", icon = icon("cog", class = "fa-pulse")),
            menuItem(text = "Dashboard4", icon = icon("cog", class = "fa-border")),
            menuItem(text = "Dashboard5", icon = icon("hourglass", lib = "glyphicon")),
            menuItem(text = "Dashboard6", icon = icon("square", class = "mystyle")),
            tags$style(".mystyle {color: yellow;}")
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
                    )),
            
            tabItem(tabName = "VB", 
                    fluidRow(valueBoxOutput("min__", width = 3), valueBoxOutput("max__", width = 3), valueBoxOutput("sd__", width = 3), valueBoxOutput("mean__", width = 3)),
                    fluidRow(valueBoxOutput("median__", width = 6), valueBoxOutput("orders__", width = 3), valueBoxOutput("approved__", width = 3)))
        )
    )
    
))
