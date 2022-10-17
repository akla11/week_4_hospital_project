#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(ggplot2)
library(gridExtra)

# Define Server Logic
shinyServer(function(input, output) {
  output$p1 <- renderPlot({
    df <- mtcars %>%
      pivot_longer(cols = c(mpg, disp, hp, drat, wt, qsec),
                   names_to = "continuous_variable",
                   values_to = "continuous_values")
    
    df %>%
      ggplot(aes(x = continuous_values)) +
      geom_histogram() +
      facet_wrap(~continuous_variable,
                 scales = "free")
  })
  output$p2 <- renderPlot({
    df <- mtcars %>%
      pivot_longer(cols = categorical_variables,
                   names_to = "categorical_variable",
                   values_to = "categorical_values")
    df <- df %>%
      pivot_longer(cols = c(mpg, disp, hp, drat, wt, qsec),
                   names_to = "continuous_variable",
                   values_to = "continuous_values")
    
    
    
    
    
  })
  
}