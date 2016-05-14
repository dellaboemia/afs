#Coursera Data Science Specialiation
#Data Product
#Alternative Fuel Stations
#John James
#May 13, 2016
# Libraries
library(RCurl)
library(datasets)
library(jsonlite)
library(leaflet)
library(RDSTK)
library(rgeos)
library(shiny)
library(sp)
library(zipcode)

# Zipcode, state, city data
data("zipcode")

# Initiate fuel types for Pulldown
fuel_types <- list("Biodiesel (B20 and above)" = "BD",
                   "Compressed Natural Gas" = "CNG",
                   "Ethanol (E85)" = "E85",
                   "Electric" = "ELEC",
                   "Hydrogen" = "HY",
                   "Liquefied Natural Gas" = "LNG",
                   "Liquefied Petroleum Gas (Propane)" = "LPG")

# Connector types
connector_types <- list("NEMA 5-15 (Level 1)" = "NEMA515",
                        "NEMA 5-20 (Level 1)" = "NEMA520",
                        "NEMA 14-50 (Level 1)" = "NEMA1450",
                        "J1772 (Level 2)" = "J1772",
                        "CHAdeMO (DC fast charging)" = "CHADEMO",
                        "SAE J1772 Combo (DC fast charging)" = "J1772COMBO",
                        "Tesla (DC fast charging)" = "TESLA")
# Capture state abbreviations for ui select
states <- state.abb

# Download alternative fuel station data
apsUrl <- "https://api.data.gov/nrel/alt-fuel-stations/v1.csv?api_key=zhiWRDbKkuL7G0Iwm2IifkfxfBeqcJ46GaHQnv5E&format=csv"

# Download alternative fuel data for current day.
today <- Sys.Date()
cDate <- as.Date(file.info("./data/afs.csv")$ctime)
if ((!file.exists("./data/afs.csv")) | (cDate != today)){
  download.file(apsUrl, destfile = "./data/afs.csv", method = "libcurl")
}


afs <- read.csv("./data/afs.csv", na.strings = "")
