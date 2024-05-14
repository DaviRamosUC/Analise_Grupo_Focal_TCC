install.packages("tidyverse")
install.packages("tm")
install.packages("wordcloud")
install.packages("topicmodels")
install.packages("igraph")

library("tidyverse")
library("tm")
library("wordcloud")
library("topicmodels")
library("igraph")

getwd()

mytext <-scan("C:/Users/ifbad/Desktop/transcricao/transcricaoFormatada.txt", what = "character")

mytext <- tm_map(mytext, removePunctuation)
mytext <- tm_map(mytext, гemoveNumbers)
mytext <- tm_map(mytext, content_transformer(tolower))
mytext <- tm_mp(mytext, гemovewords, stopwords("portuguese"))
mytext <- tm_map(mytext, stripwhitespace)
mytext <- tm_map (mytext, removewords, c("joão", "neves", "fontoura"))
for (j in seq (mytext)) {
  mytext[[j]] <- gsub("-", " ", mytext[[j]])
  mytext[[j]] <- gsub("IX", " ", mytext[[j]])
}
wordcloud (mytext, min.freq = 1, max.words = 100, random.order = FALSE,
           random.color = FALSE, rot.per=0.35,
           colors = brewer.pal(8, "Blues"))
?wordcloud
length (stopwords ("portuguese"))
stopwords ("portuguese")

