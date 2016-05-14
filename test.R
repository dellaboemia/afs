#Coursera Data Science Specialiation
#Data Product
#Alternative Fuel Stations
#John James
#May 13, 2016

# library(zipcode)
# library(magrittr)
# library(leaflet)
# 
# stateInput <- "CA"
# cityInput <- "San Francisco"
# zipInput <- "94133"
# 
# data(zipcode)
# 
# stations <- function(){
#   location <- subset(zipcode, city==cityInput & state==stateInput)
#   afs  <- subset(afs, City %in% location$city & State %in% location$state)
#   cbind(afs$Longitude, afs$Latitude)
# }
# 
# m <- leaflet()  %>%
#     addTiles() %>%
#     addCircles(data = stations())
# print(m)