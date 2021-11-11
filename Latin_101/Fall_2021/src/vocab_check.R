require(tidyverse)

(120-x)/120
95

sent.df <- read.csv("from_sent_9.csv")
vocab.df <- read.csv("vocab9.csv")



sent.lemma <- apply(sent.df, 1, strsplit, ",")
sapply(sent.lemma[[1]], "[[", 1)

x <- sent.lemma[[1]] %>%
  unlist()
x[1]

holder.1 <- vector(mode = "character", length(sent.lemma))

for (i in 1:577) {
  
  x <- sent.lemma[[i]] %>%
    unlist()
  x <- x[1]
  holder.1[i] <- x
  
  
}

i <- 1

vocab.lemma <- apply(vocab.df, 1, strsplit, ",")
sapply(sent.lemma[[1]], "[[", 1)

x <- sent.lemma[[1]] %>%
  unlist()
x[1]

holder.2 <- vector(mode = "character", length(vocab.lemma))

for (i in 1:147) {
  
  x <- vocab.lemma[[i]] %>%
    unlist()
  x <- x[1]
  holder.2[i] <- x
  
  
}

holder.2 <- holder.2 %>%
  gsub(":.*", "", .)

holder.2 <- holder.2 %>%
  gsub(" .*", "", .)

holder.2[121] <- "se"

holder.1

which(holder.1 %in% holder.2)

holder.1[-which(holder.1 %in% holder.2)] %>%
  sort()
