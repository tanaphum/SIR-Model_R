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
  titlePanel("SIR Model"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("S",
                   "Number of People:",
                   min = 10000,
                   max = 500000,
                   value = 100000),
       sliderInput("alpha",
                   "Number of alpha:",
                   min = 0,
                   max = 1,
                   value = 0.3),
       sliderInput("beta",
                   "Number of beta:",
                   min = 0,
                   max = 1,
                   value = 0.1),
       sliderInput("gamar",
                   "Number of gamar:",
                   min = 0,
                   max = 1,
                   value = 0.05)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot")
    )
  )
))
