
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Location of City Entrepeurs"),
  
  #So ideally I'd like to see if I can do some helpers.R thing that shows all businesses of the size. The slider will change the maximum 
  # and minimum amount of people in the business. Perhaps something like the amount of people will increase in each city?

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    
    sidebarPanel(
      helpText("Create demographic maps with 
        information from the 2014 US Entrepenuer Census. 
               Please be patient, as the map can take up to 20 seconds to load because of the amount of data."),
      
      sliderInput("range",
                  "Appoximate size of business (note: -1 represents All firms):",
                  min = -1,
                  max = 250,
                  value = 10)
    ),

    # Show a plot of the map
    mainPanel(plotOutput("map"))
  )
))
