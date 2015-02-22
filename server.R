library(shiny)
library(ggplot2)

# read HTN maximum data
htn <- read.csv('htn.csv')

# create plot
gp <-ggplot(htn, aes(x=Height, y=Systolic, color=Gender))
gp <- gp + geom_point(size=4)
gp <- gp + scale_x_continuous(name='Height, cm')
gp <- gp + scale_y_continuous(name='Systolic blood pressure, mmHg')

pp <- renderPlot({ print(gp) })

shinyServer(function(input, output) {
    output$main_plot <- pp
    output$prediction <- renderText({
        max.systolic <- subset(htn,
           Height == input$height & Gender == input$gender)$Systolic

        if (max.systolic < input$systolic) {
            'The child is likely to have hypertension.'
        } else {
            'The child does not have hypertension.'
        }

        })

})
