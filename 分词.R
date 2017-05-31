library(RColorBrewer)
library(wordcloud2)
library(tm)  
library(NLP)

wordcloud2(demoFreq)
wordcloud2(demoFreq, size = 0.8,shape='triangle-forward') 
wordcloud2(demoFreq, size = 0.8, color = "random-light", backgroundColor = "grey")
letterCloud(demoFreqC,word="JAVA",size = 2)  
letterCloud(demoFreqC,word="挖",size = 2) 

wordcloud2(demoFreq, size = 1, minRotation = -pi/2, maxRotation = -pi/2)