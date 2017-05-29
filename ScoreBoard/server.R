library(DT)
source("./scripts/ScoreUpdator.R")
shinyServer(function(input, output){
    observeEvent(input$submit,{
      file <- input$file
      if(!is.null(file)){
        file <- read.csv(file$datapath, header = TRUE)
        PIN <- input$PIN
        updateScore(file, PIN)
      }
    })
    create.data  <- eventReactive(input$submit, {
     scoreboard <- read.csv("./data/output/ViewableScoreboard.csv", header = TRUE)
    },
    ignoreNULL = FALSE)
    output$contents <- renderDataTable({
      create.data()
    })
})