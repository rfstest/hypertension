library(shiny)

shinyUI(pageWithSidebar(
    headerPanel('Children Hypertension Check'),
    sidebarPanel(
        p('Enter the gender, height, and the daily average of the systolic blood pressure of a child.'),
        radioButtons('gender', label = h3('Gender'),
                     choices = list('Male' = 'M', 'Female' = 'F'),
                     selected = 'M'),
        sliderInput('height', label = h3('Height (cm)'),
                    min = 120, max = 180, value = 150, step=10),
        sliderInput('systolic', label = h3('Systolic blood pressure (mmHg)'),
                    min = 75, max = 240, value = 100, step=2)
    ),
    mainPanel(
        tabsetPanel(type = "tabs",
            tabPanel('Result',
                h2('Prediction'),
                textOutput('prediction')
            ),
            tabPanel("Documentation",
                h2('Hypertension'),
                p('Hypertension (HTN) or high blood pressure is a chronic medical condition in which the blood pressure in the arteries is elevated.'),
                p('Hypertension puts strain on the heart, leading to hypertensive heart disease and coronary artery disease. Hypertension is also a major risk factor for stroke, aneurysms of the arteries, peripheral arterial disease and chronic kidney disease.'),
                p('Hypertension is diagnosed, if the daily average of the systolic blood pressure is higher than the maximum normal value, which differs for boys and girls and depends on the height.'),
                p('The following scatterplot can be used for determining the maximum normal value for a certain height for boys and girls.'),
                plotOutput('main_plot'),
                p('You can also use the form at the left side to determining if a certain child has hypertension.')
            )
        )

    )
))
