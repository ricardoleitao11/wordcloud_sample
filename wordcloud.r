rm(list = ls(all = TRUE))
library(xlsx)
library(dplyr)
library(bit64)
library(magrittr)
library(tm)
library(stringi)
library(wordcloud)

Sys.setlocale("LC_ALL", "de_DE.UTF-8")

setwd('C:/Users/ricardo.leitao/Downloads')
base <- read.csv('nasa.csv', header = T, sep=";", encoding = 'utf-8')

base <- base[,1:8]


como_protege <- vapply(base$como_protege, paste, collapse=",", character(1L))

quer_fazer <- vapply(base$quer_fazer, paste, collapse=",", character(1L))


pal2 = brewer.pal(8,'Dark2')

cloud1 = como_protege %>% tolower %>% 
  removePunctuation %>% removeWords(., stopwords('pt'))


cloud2 = quer_fazer %>% tolower %>% 
  removePunctuation %>% removeWords(., stopwords('pt'))

set.seed(20)
x11()

wordcloud(cloud1, min.freq=3,max.words=100, random.order=F, colors=pal2)

x11()
wordcloud(cloud2, min.freq = 3, max.words = 100, random.order = F, colors = pal2)

