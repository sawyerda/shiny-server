updateScore <- function(vector, id){
  ScoreBoard <- read.csv("./data/output/Scoreboard.csv", header = TRUE)
  if(id == 0 || !(id %in% ScoreBoard$PIN)){
    
  }
  else{
    student <- data.frame(subset(ScoreBoard, ScoreBoard$PIN == id))
    old.score <- student$Score
    APRICE <- read.csv("./data/input/housedata.csv")
    new.score <- sqrt(mean((vector$x - APRICE$price)^2))
    print(new.score)
    if(!is.nan(new.score)){
      if(new.score < old.score){
        new.entry <- data.frame(PIN = id, Names = student$Names, Score = new.score) # creating new observation
        ScoreBoard <- ScoreBoard[ ScoreBoard$PIN != student$PIN,]
        ScoreBoard <- rbind(ScoreBoard, new.entry) # adding the new score to scoreboard
        ScoreBoard <- ScoreBoard[order(ScoreBoard$Score),]
        file.remove("./data/output/ScoreBoard.csv")
        write.csv(ScoreBoard, file="./data/output/ScoreBoard.csv", row.names = FALSE) # Writing the ScoreBoard.csv
        Rank <- seq(1, length(ScoreBoard$PIN))
        ScoreBoard <- subset(ScoreBoard, select = -c(PIN))
        ScoreBoard <- data.frame(Rank, ScoreBoard)
        if(file.exists("./data/output/ViewableScoreBoard.csv")){
          file.remove("./data/output/ViewableScoreBoard.csv")
        }
        write.csv(ScoreBoard, file="./data/output/ViewableScoreBoard.csv", row.names = FALSE)
        remove("student")
      }
   }
   else{
    
   }
  }
  remove("ScoreBoard")
}