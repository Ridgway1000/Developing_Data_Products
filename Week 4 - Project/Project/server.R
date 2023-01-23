#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(dplyr)
library(rsconnect)
# Select columns to be used in the analysis
diamond <- diamonds[,c(1:4,7)]
# Define server logic required to draw a plot
shinyServer(function(input, output) {
        output$distPlot <- renderPlot({
                # Select the diamond based on the user input values
                diamond <- filter(diamonds, grepl(input$cut, cut), grepl(input$col, color), grepl(input$clar, clarity))
                # build a linear regression model
                fit <- lm( price~carat, diamond)
                # predicts the price
                prediction <- predict(fit, newdata = data.frame(carat = input$car,
                                                          cut = input$cut,
                                                          color = input$col,
                                                          clarity = input$clar))
                
                # Draw the plot using ggplot2
                plot <- ggplot(data=diamond, aes(x=carat, y = price))+
                        geom_point(aes(color = cut), alpha = 0.3)+
                        geom_smooth(method = "lm")+
                        geom_vline(xintercept = input$car, color = "orange")+
                        geom_hline(yintercept = prediction, color = "purple")
                plot
        })
        output$result <- renderText({
                # Renders the text for the prediction below the graph
                diamond <- filter(diamonds, grepl(input$cut, cut), grepl(input$col, color), grepl(input$clar, clarity))
                fit <- lm( price~carat, diamond)
                prediction <- predict(fit, newdata = data.frame(carat = input$car,
                                                          cut = input$cut,
                                                          color = input$col,
                                                          clarity = input$clar))
                res <- paste(round(prediction, digits = 1.5),"$" )
                res
        })
        
})
