# @param var: a list of 50 items that corresponds to each state alphabetically and their percent of women in the business of the given size
percent_map <- function(var, color, legend.title) {

  # generate vector of fill colors for map
  shades <- colorRampPalette(c("white", color))(100)
  
  # constrain gradient to percents that occur between min and max
  #var <- pmax(var, min)
  #var <- pmin(var, max)
  #percents <- as.integer(cut(var, 100, 
  #  include.lowest = TRUE, ordered = TRUE))
  #fills <- shades[percents]
  fills <- shades[head(var, 50)]

  # plot choropleth map
  #map("county", fill = TRUE, col = fills, 
  #  resolution = 0, lty = 0, projection = "polyconic", 
  #  myborder = 0, mar = c(0,0,0,0))
  
  # overlay state borders
  map("state", fill = TRUE, col = fills,
    lty = 1, lwd = 1, projection = "polyconic", 
    myborder = 0, mar = c(0,0,0,0))
  
  # add a legend
  legend.text <- c("24% or less",
    "25%",
    "50%",
    "75%",
    "76% or more")
  
  legend("bottomright", 
    legend = legend.text, 
    fill = shades[c(1, 25, 50, 75, 100)], 
    title = "Percent women in the state for businesses of this size")
}











