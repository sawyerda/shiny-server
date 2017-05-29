given.score = 0 # beat this score

k = 1:999 # the upper limit of what to have sample pull
roster <- read.csv("./data/input/roster.csv") # getting the names from the class roster
class.size <- length(roster$Names) # setting the class size
score = rep(1000000000, class.size) # initiating the score vector
pinVector <- sample(k, class.size, replace = FALSE) # initiating pin vector
ScoreBoard <- data.frame(PIN = pinVector, Names = roster$Names, Score = score) # creating scoreboard                                                                  dataframe
beat.this <- data.frame(PIN = 0, Names = "Beat This", Score = given.score) # creating beat this dataframe
ScoreBoard <- rbind(ScoreBoard, beat.this) # adding a beat this to scoreboard
ScoreBoard <- ScoreBoard[order(ScoreBoard$Score),]
if(file.exists("./data/output/ScoreBoard.csv")){
  file.remove("./data/output/ScoreBoard.csv")
}
write.csv(ScoreBoard, file="./data/output/ScoreBoard.csv", row.names = FALSE) # Writing the ScoreBoard.csv
remove("ScoreBoard")
remove("roster")
remove("beat.this")



