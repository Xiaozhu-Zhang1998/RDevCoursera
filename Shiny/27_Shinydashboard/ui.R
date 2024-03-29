library(shiny)
library(shinydashboard)
library(plotly)
library(datasets)
library(ggplot2)
library(shinyBS)
library(shinyjs)
library(DT)
library(shinycssloaders)

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
            menuItem(text = "Dashboard1", tabName = "db1", icon = icon("tachometer", class = "fa-rotate-90")),
            menuItem(text = "Dashboard2", icon = icon("cog", class = "fa-spin")),
            menuItem(text = "Dashboard3", icon = icon("cog", class = "fa-pulse")),
            menuItem(text = "Dashboard4", icon = icon("cog", class = "fa-border")),
            menuItem(text = "Dashboard5", icon = icon("hourglass", lib = "glyphicon")),
            menuItem(text = "Dashboard6", icon = icon("square", class = "mystyle")),
            tags$style(".mystyle {color: yellow;}")
        )
    ),
    
    dashboardBody(
        bsPopover(id = "inline", title = "Mean",
                  content = "Mean price of diamonds",
                  trigger = "hover",
                  placement = "bottom",
                  options = list(container = "body")),
        
        bsPopover(id = "q1", title = "How this works",
                  content = "Divide the sum of all diamond prices by the number of diamonds",
                  trigger = "hover",
                  placement = "right",
                  options = list(container = "body")),
        
        shinyjs::useShinyjs(),
        
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
                    ),
                    fluidRow(
                        infoBoxOutput("mean_2", width = 6)
                    )),
            
            tabItem(tabName = "VB", 
                    fluidRow(valueBoxOutput("min__", width = 3), valueBoxOutput("max__", width = 3), valueBoxOutput("sd__", width = 3), valueBoxOutput("mean__", width = 3)),
                    fluidRow(valueBoxOutput("median__", width = 6), valueBoxOutput("orders__", width = 3), valueBoxOutput("approved__", width = 3))),
            
            tabItem(tabName = "db1", 
                    box(width = 5, title = "Input data", status = "primary", solidHeader = TRUE,
                        fileInput("file..", "Upload Data"), 
                        
                        # View data action button hidden initially until the dataset is loaded
                        shinyjs::hidden(
                            div(id = "data_b", style = "display:inline-block",
                                actionButton("data_button", "View Data", icon = icon("table")))
                        ),

                        # View plot action button hidden initially until the dataset is loaded
                        shinyjs::hidden(
                            div(id = "plot_b", style = "display:inline-block",
                                actionButton("plot_button", "View Plot", icon = icon("bar-chart")))
                        )
                        
                        ))
        ),
        
        ## Shiny BS Modal to display the dataset inside a modal
        ## A spinner is also added
        bsModal(id = "dataset", title = "Diamonds Dataset", trigger = "data_button", size = "large",
                withSpinner(dataTableOutput("data_set"))), 
        
        ## Shiny BS Modal ti display the plot inside a modal
        ## A spinner is also added
        bsModal(id = "Plot", title = "Plot", trigger = "plot_button", size = "large",
                sliderInput("b", label = "Select the number of bins", min = 55, max = 100, value = 50),
                br(),
                withSpinner(plotOutput("plot_gg")))
        
    )
    
    
    
))
