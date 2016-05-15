#Coursera Data Science Specialiation
#Data Product
#Alternative Fuel Stations
#John James
#May 13, 2016

getLong <- function() {
  x <- subset(zipcode, city==input$city & state==input$state)
  x$longitude
}

getLat <- function() {
  x <- subset(zipcode, city==input$city & state==input$state)
  x$latitude
}  

m <- renderLeaflet({
  leaflet()  %>%
    addTiles() %>%
    setView(lng = getLong(), lat = getLat(), zoom = 15) %>%
    addCircles(data = afs, lat = ~ Latitude, lng = ~ Longitude, popup = ~Station.Name)

print(m)
})