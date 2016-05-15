#Coursera Data Science Specialiation
#Data Product
#Alternative Fuel Stations
#John James
#May 13, 2016

shinyUI(pageWithSidebar(
  headerPanel("Alternative Fuel Stations"),
  sidebarPanel(
    selectInput("fuel", "Fuel Type:", fuel_types, multiple = TRUE, selectize = FALSE),
    selectInput("connector", "Connector Type:", connector_types, multiple = TRUE, selectize = FALSE),
    selectInput("state", label = ("State:"), state.name),
    htmlOutput("cityUi"),
    textInput(inputId = "zip", label = "Zipcode:"),
    actionButton("refresh", "Render Map")
  ),
    mainPanel(leafletOutput("m"))
  )
)