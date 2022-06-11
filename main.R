library(shiny)


# Define UI for miles per gallon app ----
ui <- fluidPage(
  
  # App title ----
  headerPanel("Calculate your BMI"),
  
  # Sidebar panel for inputs ----
  sliderInput(inputId= 'weight', 
              label = 'Choose your weight in kgs',
              value = 25, min=1, max = 200, step=1),
  sliderInput(inputId= 'height', 
              label = 'Choose your height in feet',
              value = 5, min=0, max = 10, step= 0.1),
  
  # Main panel for displaying outputs ----
  mainPanel(
      textOutput("yourBMI")
  )
)

# Define server logic to plot various variables against mpg ----
server <- function(input, output) {
  #input$height_m <- input$height/3.28084
  output$yourBMI <- renderText({
    paste('Your BMI is',
          input$weight / (input$height/3.28084)^2)})
 
  
  
}

shinyApp(ui, server)