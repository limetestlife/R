library("SparseM")
library("RTextTools")
library("e1071")
pos_tweets = rbind(
  c('I love this cat','positive'),
  c('This view is amazing','positive'),
  c('I feel great this morning','positive'),
  c('I am so excited about the concert','positive'),
  c('He is my best friend','positive')
)

neg_tweets = rbind(
  c('I love this cat','negative'),
  c('This view is amazing','negative'),
  c('I feel great this morning','negative'),
  c('I am so excited about the concert','negative'),
  c('He is my best friend','negative')
)


testg_tweets = rbind(
  c('feel happy this morning','positive'),
  c('larry friend','positive'),
  c('not like that man','positive'),
  c('house not great','positive'),
  c('your song annoying','positive')
)


tweets = rbind(pos_tweets,neg_tweets,testg_tweets)

#创建词条文档矩阵
matrix = create_matrix(
  tweets[,1],language = 'english',
  removeStopwords =FALSE,removeNumbers=TRUE,stemWords=FALSE
)


mat = as.matrix(matrix)
classifier = naiveBayes(mat[1:10,],as.factor(tweets[1:10,2]))


predicted = predict(classifier,mat[11:15,])
predicted


recall_accuracy(tweets[11:15,2],predicted)






