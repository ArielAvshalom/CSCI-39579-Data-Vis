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
      
      conditionalPanel(condition = "input.conditionedPanels == 'Curve'",
      sliderInput("xend", "choose where your x axis ends",
                  min = 1,
                  max = 30,
                  value = 15),
      sliderInput("yend", "choose where your x axis ends",
                  min = 1,
                  max = 120,
                  value = 80),
      selectInput("colorvar", "choose the variable to color by",
                  choices = c("supp", "dose"),
                  selected = "supp")
      ),
      
      conditionalPanel(condition = "input.conditionedPanels == 'Violin'",
      checkboxInput('trim', "add or remove edge cases", value = FALSE),
      
      selectInput("colorvar2", "choose the variable to color by",
                  choices = c("supp", "dose"),
                  selected = "supp"))
      
      
      
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(
        tabPanel("Curve Plot", value = "Curve", plotOutput("distPlot")),
        tabPanel("Violin Plot", value = "Violin", plotOutput("plot2")),
        id = "conditionedPanels"
      )
       
    )
  )
))
