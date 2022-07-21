#' https://github.com/ropensci/rnoaa

#' Loading rnoaa package to obtain precipitation data
#' devtools::install_github("ropensci/rnoaa")
library(rnoaa)
#' devtools::install_github('rstudio/leaflet')
library(leaflet)
#' devtools::install_github("ropensci/lawn")
library(lawn)
options(noaakey = "piRauSeecCMaIVkleStduqdxoaLLOPMs")
#' Consider the grid box corresponding to Australia
lawn_bbox_polygon(c(113.338953078, -43.6345972634, 153.569469029, -10.6681857235)) %>% view
#' List stations corresponding to Australia
ncdc_stations(extent = c(-43.6345972634, 113.338953078, -10.6681857235, 153.569469029))

