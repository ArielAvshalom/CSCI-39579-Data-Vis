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
   titlePanel("Ragnarock!"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         fluidRow(
           column(5,
                  h4("playin with some buttons"),
                  br(),
                  actionButton("end_of_the_world", "click here for Ragnarock"),
                  actionButton("world_peace", "click here for World Peace"),
                  br(),
                  br(),
                  submitButton("Submit", "save your choice here")),
           column(6,
                  h3("Do you want to build a snowman"),
                  br(),
                  sliderInput("snowman", "Do you want to slide a snowman",
                              min = 0,
                              max = 2021,
                              value = 28))
         ),
         fluidRow(
           h4("What is your birthday?"),
           br(),
           dateInput("birthday", "Input your birthday",
                     value = "2021-6-29")
         )
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         h1("I Like Plots GG", style = "color:turquoise", align = "center")
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

