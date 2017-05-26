library(wordcloud)  
library(tm)  
library(NLP)

sms_corpus_train<-read.csv(file="sms_spam.csv",stringsAsFactors=F)  
sms_corpus_train <- Corpus(VectorSource(sms_corpus_train$text))
wordcloud(sms_corpus_train, min.freq=30, random.order=FALSE)  