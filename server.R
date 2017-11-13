
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

cen <- read.table("census-app/data/census.dat", header = TRUE, sep = "|")

library(maps)
library(mapproj)
source("census-app/helpers.R")

get_women_owned_matrix <- function(size) {
  #Correct the size so that it will work with switch. Size represents the size of the group. 
  type <- 0
  if (size < 0)  {type <- 1
  }else if (size < 1) {type <- 611
  }else if (size < 5) {type <- 612
  }else if (size < 10) {type <- 620
  }else if (size < 20) {type <- 630
  }else if (size < 50) {type <- 641
  }else if (size < 100) {type <- 642
  }else if (size < 250) {type <- 651
  }else if (size < 500) {type <- 652
  }else type <- 657
  matr <- 0:49
  for (i in 0:49) {
    corr_size <- cen[cen$EMPSZFI == type,]
    women_owned <- nrow(corr_size[corr_size[corr_size$ST == i,]$SEX == 2,])
    total <- nrow(corr_size[corr_size$ST == i,])
    matr[i] <- women_owned / total
  }
  matr
  
}
shinyServer(function(input, output) {

  output$map <- renderPlot({

    # generate bins based on input$bins from ui.R
    percent_map(get_women_owned_matrix(input$range), "red", "EntrepeneurVis")

  })

})
