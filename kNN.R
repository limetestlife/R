wbcd <- read.csv("E:/0-R与数据挖掘/Machine-Learning-with-R-datasets-master/wisc_bc_data.csv",stringsAsFactors=FALSE)
wbcd <- wbcd[-1]
table(wbcd$diagnosis)
diagn <- factor(wbcd$diagnosis,levels = c("B","M"),labels =c("Benign","Malignant"))
round(prop.table(table(diagn))*100,digits = 1)