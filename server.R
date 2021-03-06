#Coursera Data Science Specialiation
#Data Product
#Alternative Fuel Stations
#John James
#May 13, 2016

shinyServer(function(input, output, session) {

  # Render list of states
  output$stateUi <- renderUI({
    selectInput("state", label = ("State:"), c(Choose='', state.name), selectize = FALSE)
  })
  
  # Render list of cities for state selected
  output$cityUi <- renderUI({
    selectInput("city", label = "City",choices = c(Choose='',unique(subset(zipcode, State.Name == input$state)$City)), 
                selectize = FALSE)
  })

    # Render zip code field
  output$zipUi <- renderUI({
    textInput(inputId = "zip", label = "Zipcode:")
  })
  

  # Get longitude and latitude for state and city selected
  getCenter <- eventReactive(input$refresh, {
    if (nrow(subset(zipcode, Zip == input$zip)) > 0) {
      subset(zipcode, Zip == input$zip)
    } else {
    subset(zipcode, City==input$city & State.Name==input$state)[1,]
  }}, ignoreNULL = FALSE)

  output$m <- renderLeaflet({
    cols <- rainbow(length(levels(afs$Fuel.Type.Code)), alpha = NULL)
    afs$colors <- cols[unclass(afs$Fuel.Type.Code)]
    leaflet()  %>%
    addTiles() %>%
    setView(lng = getCenter()$Longitude, lat = getCenter()$Latitude, zoom = 12) %>%
    addCircleMarkers(data = afs, lat = ~ Latitude, lng = ~ Longitude, popup = ~Station.Name, color = ~colors) %>%
    addLegend(position = "bottomright", labels = fuel_types, colors = cols)
  })

  output$table <- renderTable({
    if (nrow(subset(afs, ZIP == input$zip)) !=0) {
      x <- subset(afs, ZIP == input$zip)
    } else {
      x <- subset(afs, City == input$city & State.Name == input$state)
    }
    x[vars]
    })
})