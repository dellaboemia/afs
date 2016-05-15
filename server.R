#Coursera Data Science Specialiation
#Data Product
#Alternative Fuel Stations
#John James
#May 13, 2016

shinyServer(function(input, output, session) {

  output$cityUi <- renderUI({
    selectInput("city", label = "City",choices = subset(zipcode, state == input$state)$city)
  })

  getLong <- eventReactive(input$refresh, {
    x <- subset(zipcode, city==input$city & state==input$state)
    x[1,]$longitude
  }, ignoreNULL = FALSE)

  getLat <- eventReactive(input$refresh, {
    x <- subset(zipcode, city==input$city & state==input$state)
    x[1,]$latitude
  }, ignoreNULL = FALSE)
  
  getColors <- eventReactive(input$refresh, {
    colorFactor(topo.colors(7,alpha = NULL), input$fuel)
  }, ignoreNULL = FALSE)
  
  output$m <- renderLeaflet({
    leaflet()  %>%
    addTiles() %>%
    setView(lng = getLong(), lat = getLat(), zoom = 10) %>%
    addCircleMarkers(data = afs, lat = ~ Latitude, lng = ~ Longitude, popup = ~Station.Name, color = ftc$color) %>%
    addLegend(position = "bottomright", labels = fuel_types, colors = ftc$color)
  })
})