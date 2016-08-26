library(twitteR)
#getUser("minsaude")
#load("~/Dropbox/credentials/my_oauth")
#options(httr_oauth_cache=TRUE) #This will enable the use of a local file to cache OAuth access credentials between R sessions.
#setup_twitter_oauth(consumer_key = "Z2ylc2PCCT1RHC3bULRlFZe6e",
#                    consumer_secret = "tTGnPZiPJhRhMAS0AG5nYDbPQ1sxLTr838ibuQ7QDqdCVcWYTH",
#                    access_token = "616715766-l8bzWPYKARP6DBQnvOAcJH6TEFBlSWyoXOGsPjCK",
#                    access_secret = "FhRd94eTycnvJp5tgUAGfR7O8AZTwv6iQ7ecDQ8tRRMVt")

library(smappR)
minsaude_followers <- smappR::getFollowers("minsaude", oauth_folder = "~/Dropbox/credentials")
user_data <- smappR::getUsersBatch(id = minsaude_followers, oauth_folder = "~/Dropbox/credentials")
#save(list = "user_data", file = "data/user_data.RData")
user_data$location[user_data$location == ""] <- NA

### from lucas puente
#Install key package helpers:
source("https://raw.githubusercontent.com/LucasPuente/geocoding/master/geocode_helpers.R")
#Install modified version of the geocode function
#(that now includes the api_key parameter):
source("https://raw.githubusercontent.com/LucasPuente/geocoding/master/modified_geocode.R")
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
geocode_results <- sapply(locs, geocode_apply, simplify = FALSE)
condition_a <- sapply(geocode_results, function(x) x["status"]=="OK")
geocode_results<-geocode_results[condition_a]
condition_b <- lapply(geocode_results, lapply, length)
condition_b2<-sapply(condition_b, function(x) x["results"]=="1")
geocode_results<-geocode_results[condition_b2]
length(geocode_results)
source("https://raw.githubusercontent.com/LucasPuente/geocoding/master/cleaning_geocoded_results.R")
results_b<-lapply(geocode_results, as.data.frame)
results_c<-lapply(results_b,function(x) subset(x, select=c("results.formatted_address",
                                                           "results.geometry.location")))
results_d<-lapply(results_c,function(x) data.frame(Location=x[1,"results.formatted_address"],
                                                   lat=x[1,"results.geometry.location"],
                                                   lng=x[2,"results.geometry.location"]))

results_e <- data.table::rbindlist(results_d)

results_f<-results_e[,Original_Location:=names(results_d)]

ipak <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg)) 
    install.packages(new.pkg, dependencies = TRUE, repos="http://cran.rstudio.com/")
  sapply(pkg, require, character.only = TRUE)
}
packages <- c("maps", "mapproj")
ipak(packages)



