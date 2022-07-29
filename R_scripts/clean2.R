library(readr)
sets2 <- read_csv("sets.csv")
tournaments <-  read_csv("tournament_info.csv")
players <- read_csv("players2.csv")

keep <- tournaments$key
sets2 <- subset(sets2, tournament_key %in% keep)

sets2 <- sets2[c(3,4,5,6)]

randp <- sample.int(26759,10000)
matchups <- players$player_id
tags <- players$tag
matchups <- matchups[randp]
tags <- tags[randp]
View(matchups)
opponents <- NULL

for (i in 1:10000) {
  matchups[i]
  sb <- subset(sets2,p1_id == matchups[i])
  sb2 <- subset(sets2,p2_id == matchups[i])
  p1 <- paste(sb$p2_id, collapse = "-")
  p1 <- paste(p1,sb2$p1_id, collapse = "-")
  opponents[i] <- p1

}

matchups <- data.frame(row.names = c(1:10000) ,opponents,matchups,tags)

View(opponents)
typeof(opponents)

write.csv(matchups,"Test4.csv", row.names = TRUE)
