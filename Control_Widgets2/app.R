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
   titlePanel("plyin with widgets"),
   
   fluidRow(
     
     column(2,
            h3("Buttons"),
            actionButton('touch', 'Do not touch me!'),
            br(),
            br(),
            submitButton('click here to submit')
            
            ),
     column(2,
            h2('checkbox 1'),
            checkboxInput('checkbox', 'click here to travel the world in 80 days', value = FALSE)
     ),
     column(3,
            checkboxGroupInput('checkGroup',
            h1('label for checkbox groups'),
            choices = list("choice 1" = 1,
                           "Choice 2" = 2,
                           'Choice uniqlo' = 3)
            )
            ),
     
     column(1,
            dateInput('date',
            h5("Experation Date"),
            value = '2021-11-29')
     )
     
   ),
   
   fluidRow(
     
     column(3,
            dateRangeInput("Vacation_stay", h3('When did you go on vacation?'))
     )
   )

  
  )

# Define server logic required to draw a histogram
server <- function(input, output) {
   
}

# Run the application 
shinyApp(ui = ui, server = server)

