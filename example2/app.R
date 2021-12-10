library(shiny)

#csv_data <- read.csv("C:\\Users\\Ariel\\Documents\\R\\win-library\\4.1\\Hmisc\\tests\\csv\\TEST.csv")

ui <- fluidPage(
  actionButton("run_if_tag", "Uniform"),
  actionButton("rnorm_if_tag", "Normal"),
  actionButton('none', 'click here to erase'),
  hr(),
  plotOutput("plot")
)

server <- function(input, output){
  v <- reactiveValues(data = NULL)
  
  observeEvent(input$none, {
    v$data <- NULL
  })
  
  observeEvent(input$run_if_tag, {
    v$data <- runif(100)
  })
  
  observeEvent(input$rnorm_if_tag, {
    v$data <- rnorm(100)
  })  
  
  output$plot <- renderPlot({
    if (is.null(v$data)) return()
    hist(v$data)
  })
}

shinyApp(ui, server)