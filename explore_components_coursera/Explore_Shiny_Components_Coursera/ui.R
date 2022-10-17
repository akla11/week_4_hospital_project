#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)

# Variablen festlegen, die als kategoriale Variable gehandhabt werden soll

categorical_variables = c("cyl", "vs", "am", "gear", "carb")

# Application Layout
shinyUI(fluidPage(
  titlePanel(title = div(img(src = "2_shiny_logo.png", height = 50, width = 100),
                         "Data Exploration Using Shiny")),
# Define sidebar layout with sidebar panel and main panel 
sidebarLayout(
  sidebarPanel(
    h3("Explore mtcars"),
    # Input 1: variable select
    varSelectInput("continuous_variable", "Select Continuous Variable",
                   data = select(mtcars, -categorical_variables), 
                   selected = "cyl"),
    # Input 2: variable select
    varSelectInput("categorical_variable", "Select Categorical Variable",
                   data = mtcars[categorical_variables], selected = "cyl"),
    # Input 3: slider 
    sliderInput("bins", "Histogram: Number of bins", min = 2, max = 20, 
                value = 10),
    # Add Plot Guide
    h4("Plot Variable Map Guide"),
    p("Miles/gallon = mpg", br(),
      "Displacement ....", br()
      )),
  tabsetPanel(
    tabPanel("Plots for Observing Data Trend",
      plotOutput("p1"),
      plotOutput("p2")),
    tabPanel("Plots for Observing Data Correlation",
      plotOutput("p3")),
    tabPanel("Plots with Observing Inner Subdivision Value",
      plotOutput("p4"))
  )
)))

  