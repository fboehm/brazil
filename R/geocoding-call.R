# calls to google maps API
load("data/user_data.RData")

`%notin%` <- function(elem, set){
  !(elem %in% set)
  }

#Install modified version of the geocode function
#(that now includes the api_key parameter):
source("R/geocoding-master/modified_geocode.R")
geocode_apply<-function(x){
  geocode(x, source = "google", output = "all", api_key="AIzaSyBnR6m37FrIR7SkDj7ZPyg5pmbrL68PWFI")
}
# api key calling will take time, I think
library(jsonlite)
library(dplyr)
library(plyr)
#####
#foo <- user_data$location[1:500]
#foo <- foo[!is.na(foo)]
#geocode_results <- sapply(foo, geocode_apply, simplify = FALSE)
#####
locs <- user_data$location[!is.na(user_data$location)]
locs <- locs[1:10]
geocode_results <- sapply(locs, geocode_apply, simplify = FALSE)
save(list = "geocode_results", file = "geocode_results.RData")
