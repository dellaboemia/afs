#Coursera Data Science Specialiation
#Data Product
#Alternative Fuel Stations
#John James
#May 13, 2016

shinyServer(function(input, output, session) {

  # Render list of cities for state selected
  output$cityUi <- renderUI({
    state.code <<- subset(states, name == input$state)
    selectInput("city", label = "City",choices = subset(zipcode, state == state.code$abb)$city)
  })

  # Get longitude for state and city selected
  getLong <- eventReactive(input$refresh, {
    x <- subset(zipcode, city==input$city & state==state.code$abb)
    x[1,]$longitude
  }, ignoreNULL = FALSE)

  # Get latitude for state and city selected
  getLat <- eventReactive(input$refresh, {
    x <- subset(zipcode, city==input$city & state==state.code$abb)
    x[1,]$latitude
  }, ignoreNULL = FALSE)
  
  output$m <- renderLeaflet({
    leaflet()  %>%
    addTiles() %>%
    setView(lng = getLong(), lat = getLat(), zoom = 10) %>%
    addCircleMarkers(data = afs, lat = ~ Latitude, lng = ~ Longitude, popup = ~Station.Name, color = ftc$color) %>%
    addLegend(position = "bottomright", labels = fuel_types, colors = ftc$color)
  })
})