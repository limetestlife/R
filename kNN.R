
library("class")
library("gmodels")


wbcd <- read.csv("E:/0-R与数据挖掘/Machine-Learning-with-R-datasets-master/wisc_bc_data.csv",stringsAsFactors=FALSE)
wbcd <- wbcd[-1]
table(wbcd$diagnosis)
diagn <- factor(wbcd$diagnosis,levels = c("B","M"),labels =c("Benign","Malignant"))

round(prop.table(table(diagn))*100,digits = 1)
summary(wbcd[c("radius_mean","area_mean","smoothness_mean")])
summary(wbcd)

normalize <- function(x){
  return((x-min(x))/(max(x)-min(x)))
}

wbcd_n <-as.data.frame(lapply(wbcd[2:31],normalize))
summary(wbcd_n$area_mean)

wbcd_train <- wbcd_n[1:469,]
wbcd_test <- wbcd_n[470:569,]
wbcd_train_labels <- wbcd[1:469,1]
wbcd_test_labels <- wbcd[470:569,1]

wbcd_test_pred <- knn(train = wbcd_train,test = wbcd_test,cl=wbcd_train_labels,k=21)

CrossTable(x=wbcd_test_labels,y=wbcd_test_pred,prop.chisq = FALSE)


