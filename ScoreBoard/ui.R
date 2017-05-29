shinyUI(fluidPage(
  titlePanel("ScoreBoard"),
 
   sidebarLayout(
    sidebarPanel(
      numericInput(inputId ="PIN", label = "Your PIN", value = 0, min = 0, max = 999),
      
      fileInput(inputId = "file", label = h4("Upload your vectors"),
                accept = c(".csv",
                           "text/csv",
                           "text/comma-separated-values,text/plain")),
      actionButton("submit", "Submit")
      ),
 
   mainPanel(dataTableOutput("contents"))
   )
))