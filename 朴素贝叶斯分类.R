sms_raw <- read.csv("E:/0-R与数据挖掘/Machine-Learning-with-R-datasets-master/sms_spam.csv",stringsAsFactors = FALSE)
str(sms_raw)

sms_raw$type <- factor(sms_raw$type)
str(sms_raw$type)
table(sms_raw$type)

library(NLP)
library(tm)
sms_corpus <- Corpus(VectorSource(sms_raw$text))
print(sms_corpus)
inspect(sms_corpus[1:3])

corpus_clean <- tm_map(sms_corpus,tolower)
corpus_clean <- tm_map(corpus_clean,removeNumbers)
corpus_clean <- tm_map(corpus_clean,removeWords,stopwords())
corpus_clean <- tm_map(corpus_clean,removePunctuation)
corpus_clean <- tm_map(corpus_clean,stripWhitespace)

inspect(corpus_clean[1:3])
sms_dtm <- DocumentTermMatrix(corpus_clean)

sms_row_train <- sms_raw[1:4199,]
sms_row_test <- sms_raw[4200:5574,]

sms_dtm_train <- sms_dtm[1:4199,]
sms_dtm_test <- sms_dtm[4200:5574,]

sms_corpus_train <- corpus_clean[1:4199]
sms_corpus_test <- corpus_clean[4200:5574]
prop.table(table(sms_row_train$type))
prop.table(table(sms_row_test$type))

library(wordcloud)
wordcloud(sms_corpus_train,min.freq = 40,random.color = FALSE)
spam <- subset(sms_row_train,type=="spam")
ham <- subset(sms_row_train,type =="ham")
wordcloud(spam$text,max.words = 40,scale = c(3,0.5))
wordcloud(ham$text,max.words = 40,scale = c(3,0.5))

findFreqTerms(sms_dtm_train,5)
sms_dict <- dictionary(findFreqTerms(sms_dtm_train,5))


