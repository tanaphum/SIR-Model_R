#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(deSolve)
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
   
  output$distPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    mysystem3 <- function(t,State,Pars){
      with(as.list(c(State,Pars)),{
        dS <- gamar*R-alpha*S
        dI <- alpha*S-beta*I
        dR <- beta*I-gamar*R
        return(list(c(dS,dI,dR)))
      })
    }
    
    pars3 <- c(alpha = input$alpha,beta =input$beta, gamar = input$gamar)
    yini3 <- c(S = input$S,I=0,R=0)
    times3 <- seq(0,10,0.01)
    
    
    
    out <-ode(yini3,times= times3,func = mysystem3,parms = pars3,method = "rk4")
    plot(out)
    
  })
  
})
