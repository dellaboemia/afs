#Coursera Data Science Specialiation
#Data Product
#Alternative Fuel Stations
#John James
#May 13, 2016

shinyServer(function(input, output, session) {

  # output$cityUi <- renderUI({
  #   selectInput("city", label = "City",choices = subset(zipcode, state == input$state)$city)
  # })
  
  citySearch <- reactive({
    subset(zipcode, state == input$state)$city
  })

  observe({
    updateTextInput(session, "city", label = "City:", value = citySearch[,1])
  })

  # stations <- function(){
  #   location <- subset(zipcode, city==input$city & state==input$state)
  #   afs  <- subset(afs, City %in% location$city & State %in% location$state)
  #   cbind(afs$Longitude, afs$Latitude)
  #   }
    
  
  output$m <- renderLeaflet({
    leaflet()  %>%
    addTiles() %>%
    addCircles(data = stations())
  })
})