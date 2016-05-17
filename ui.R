#Coursera Data Science Specialiation
#Data Product
#Alternative Fuel Stations
#John James
#May 13, 2016

shinyUI(pageWithSidebar(
  headerPanel("Alternative Fuel Stations"),
  sidebarPanel(
    htmlOutput("stateUi"),
    htmlOutput("cityUi"),
    htmlOutput("zipUi"),
    actionButton("refresh", "Render Map")
  ),
    mainPanel(
      tabsetPanel(type = "tabs",
        tabPanel("Interactive Map", leafletOutput("m")),
        tabPanel("Data Explorer", tableOutput("table"))
      )
    )
  )
)