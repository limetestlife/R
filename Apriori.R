library(arules)
groceries <- read.transactions("E:/0-R与数据挖掘/Machine-Learning-with-R-datasets-master/groceries.csv",sep=",")
summary(groceries)
inspect(groceries[1:5])
