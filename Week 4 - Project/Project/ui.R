#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
        
        # Application title
        titlePanel("S Ridgway - Coursera Week 4 Project - Developing Data Products"),
        
        # Sidebar with options selectors
        sidebarLayout(
                sidebarPanel(
                        h2(helpText("Get a predicted price value for your Diamond")),
                        sliderInput("car", label = h4("Carats"), step = 0.2, value = 0.2, min = 0.2, max = 5.0),
                        selectInput("cut", label = h4("Diamond Cut"),
                                    choices = list("Shallow" = "Fair", "Deep" = "^Good",
                                                   "Very Good" = "Very Good", "Premium" = "Premium",
                                                   "Ideal" = "Ideal", "NA" = "*")),
                        selectInput("col", label = h4("Color"),
                                    choices = list("Colourless" = "D", "Near Colourless" = "E",
                                                   "Faint Yellow" = "F", "Very Light Yellow" ="G",
                                                   "Light Yellow" = "H", "Blinging Yellow" = "I", "NA" = "*")),
                        selectInput("clar", label = h4("Clarity"),
                                    choices = list("Inclusions" = "I1", "Slight Inclusions 2" = "SI2",
                                                   "Slight Inclusions 1" = "SI1", "Very Slight Inclusions 2" = "VS2", "Very Slight Inclusions 1" = "VS1",
                                                   "Very Very Slight Inclusions 2" = "VVS2", "Very Very Slight Inclusions 1" = "VVS1", "Internally Flawless" = "IF", "NA" = "*"))
                ),
                
                # Show a plot with diamonds and regression line
                mainPanel(
                        plotOutput("distPlot"),
                        h4("The predicted value of your diamond is:"),
                        h3(textOutput("result"))
                        
                )
        )
))