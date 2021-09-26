#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("some front page name"),
   
   sidebarLayout(
      sidebarPanel(
        
        fluidRow(
          
          column(5,
                 h3("Let's play with some buttons"),
                 actionButton("endWorld", "Click here to start Ragnarock"),
                 br(),
                 actionButton("saveWorld", "Click here to bring world peace"),
                 br(),
                 br(),
                 submitButton("Clicker", "submit your choice here")),
          
          column(5,
                 h4("do you want to slide a slider?"),
                    sliderInput("myslider", "slide to pick your favorite number",
                                min = 0,
                                max = 2021,
                                value = 28))
        ),
         
        fluidRow(
          h6("Select your birthday",
             dateInput("birthday", "What is your birthday?",
                       value = "2021-06-24"))
        ) 
        
        
        

      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         h1("I like plots!")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$distPlot <- renderPlot({
      # generate bins based on input$bins from ui.R
      x    <- faithful[, 2] 
      bins <- seq(min(x), max(x), length.out = input$bins + 1)
      
      # draw the histogram with the specified number of bins
      hist(x, breaks = bins, col = 'darkgray', border = 'white')
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

