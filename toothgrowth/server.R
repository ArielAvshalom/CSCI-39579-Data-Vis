#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    
    
    ggplot(ToothGrowth, aes(xend = input$xend, yend = input$yend, dose, len, color = !!as.symbol(input$colorvar))) + geom_curve()
    
    
    
    # # generate bins based on input$bins from ui.R
    # x    <- faithful[, 2] 
    # bins <- seq(min(x), max(x), length.out = input$bins + 1)
    # 
    # # draw the histogram with the specified number of bins
    # hist(x, breaks = bins, col = 'darkgray', border = 'white')
    
  })
  
  output$plot2 <- renderPlot({
    
    ggplot(ToothGrowth, aes(dose, len, color = !!as.symbol(input$colorvar2))) + geom_violin(trim = input$trim, fill = "purple", color = "darkred" ) + facet_grid(. ~ supp)  + scale_color_brewer(palette = "Dark2") + theme_classic()
    
    
  })
  
})
