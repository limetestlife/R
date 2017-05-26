library("rJava")
library("Rwordseg")
#分词
segmentCN("你好北京")
segmentCN(c("你好北京","今天是个好天气"))

#安装词典
installDict('C:/Users/liang_meng/Desktop/文本分析/计算机词汇大全.scel', 'js',dicttype = c("text", "scel"), load = TRUE)
#dictname 是自定义词典的名称(英文)
#dicttype 默认是txt
#load 表示安装后是否自动加载到内存，默认是TRUE
#listDict() 显示安装的词典
#uninstallDict() 删除安装的词典
segmentCN(c("我看的书是java思想第四版", "你看的书是高并发案例")) 
#insertWords("错过")
#deleteWords("错过") 
fc <- readLines("C:/Users/liang_meng/Desktop/文本分析/name.txt")
length(fc) 
cy <- gsub("[0-9０１２３４５６７８９ < > ~]","",fc) 
cy <- segmentCN(cy)
cy[1:2]

#加载停词
stopwords<- unlist(read.table("C:/Users/liang_meng/Desktop/文本分析/stopwords.txt",stringsAsFactors=F)) 
stopwords[1000:1100]
length(stopwords)
stopwords

removeStopWords <- function(x,stopwords) {  
  temp <- character(0)  
  index <- 1  
  xLen <- length(x)  
  while (index <= xLen) {  
    if (length(stopwords[stopwords==x[index]]) <1)  
      temp<- c(temp,x[index])  
    index <- index +1  
  }  
  temp  
}  

cy2 <-lapply(cy,removeStopWords,stopwords)  
cy2[1:2]


words <- lapply(cy2,strsplit," ")  
wordsNum <- table(unlist(words)) 
wordsNum <- sort(wordsNum) #排序 
wordsData <- data.frame(words =names(wordsNum), freq = wordsNum)

library(wordcloud)

weibo.top150 <- tail(wordsData,150) #取前150个词 

colors=brewer.pal(8,"Dark2") 

wordcloud(weibo.top150$words,weibo.top150$freq,scale=c(8,0.5),colors=colors,random.order=F)  




