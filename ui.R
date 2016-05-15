#Coursera Data Science Specialiation
#Data Product
#Alternative Fuel Stations
#John James
#May 13, 2016

shinyUI(pageWithSidebar(
  headerPanel("Alternative Fuel Stations"),
  sidebarPanel(
    selectInput("fuel", label = ("Fuel Type:"), choices = fuel_types),
    selectInput("connector", label = ("Connector Type:"), choices = connector_types),
    selectInput("state", label = ("State:"), choices = states),
    htmlOutput("cityUi"),
    textInput(inputId = "zip", label = "Zipcode:"),
    actionButton("refresh", "Render Map")
  ),
    mainPanel(leafletOutput("m"))
  )
)