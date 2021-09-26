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
  titlePanel("Superficial Liquid Release Gale Style"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout( position = "right",
    sidebarPanel(
      
      h6("Episode IV", align = "center"),
      h6("A NEW HOPE", align = "center"),
      h5("It is a period of civil war.", align = "center"),
      h4("Rebel spaceships, striking", align = "center"),
      h3("from a hidden base, have won", align = "center"),
      h2("their first victory against the", align = "center"),
      h1("evil Galactic Empire."),
      
      
       sliderInput("bins",
                   "SuperCalifrag Histogram nuggets",
                   min = 1,
                   max = 50,
                   value = 30)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(p("I like Fireworks WOO 4th of July", style = "font-size:10px;"),
              strong("Cake is high in calories, let's invent a miracle cake weight loss diet"),
              br(),
              em("let's italicize our emphasizing our html"),
              code("we can write something like code here"),
              div("let's make a section of text a nice green color", style = "color:green"),
              h2("Pizza could be better than ice cream but almost never is"),
              h5("let's get to vis already this is boring"),
              img(src = "example_your_name.jpg")
       #plotOutput("distPlot")
    )
  )
))
