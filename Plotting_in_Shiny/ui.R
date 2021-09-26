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
  titlePanel("Old Faithful Geyser Data"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput("colour", "Choose how you want to color the data",
                  choices = c("Weight" = "weight", "Tim" =  "Time", "ChickenHawk" = "Chick", "Diet"),
                  selected = "Chick"),
      checkboxInput("facet", "Click here to facet"),
      
      conditionalPanel(
        #We'll figure this out later.
        condition = "input.facet == true",
      
        selectInput("facetChoice", "Choose the var you want to facet by",
                    c("Weight" = "weight", "Tim" =  "Time", "ChickenHawk" = "Chick", "Diet"),
                    selected = "Diet")
        )
      
      
        
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot")
    )
  )
))
