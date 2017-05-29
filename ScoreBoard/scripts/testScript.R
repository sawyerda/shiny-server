source("./scripts/ScoreUpdator.R")

vector <- read.csv("./data/TestData/Sawyer_David.csv")
updateScore(vector, 950)
library(DT)