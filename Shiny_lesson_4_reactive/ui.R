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
  titlePanel("verbatim text"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       helpText("I feel like helping you today"),
       
       selectInput('var',
                   label = 'choose the variable you want to display',
                   choices = c('tired', 'awake', 'excited', 'frenetic', 'phenomenal'),
                   selected = 'tired'
                   ),
       
       sliderInput("range",
                   "what range do you want",
                   min = -100,
                   max = 100,
                   value = c(30,40)
       )
       
       #sliderInput
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       textOutput('selected_var'),
       h3(textOutput('selected_var_2')),
       
       h1(textOutput('min_max'))
       
    )
  )
))
