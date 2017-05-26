#######读取数据############################################
#
#   1.读取键盘内容，edit(),fix()
#   2.读取文本文件，常用方法read.table,scan和read.fwf
#   3.读取csv文件
#   4.读取spss文件
#   5.读取ssd文件
#   6.读取Stata文件
#   7.读取systat文件
#   8.读取hadoop文件
#   9.读取主流关系型数据库
#   10.读取excel文件  1,转成csv文件read.csv,2.xlsx包，read.xlsx(),3.RODBC 4.复制到内存中read.table("clipboard")
#   11.读取剪贴板,即从内存中读取数据 read.table("clipboard")
#
############################################################

######爬取数据##############################################
#
#   11.从网页上获取数据，quantmod(金融数据建模包),XML
#
############################################################

######生成数据##############################################
#
#   12.整数序列
#   13.等差数列
#   14.
#
############################################################


#############读取数据#######################################
#读取键盘内容
mydata <- data.frame(age=numeric(0),gender=character(0),weight=numeric(0))
mydata <- edit(mydata)
fix(mydata)

#读取文本文件(base包中，故不用导包)
txttable <- read.table("D:/Rspace/data/read.txt",header = TRUE)
cat("TITLE extra line", "2 3 5 7", "11 13 17", file = "ex.data", sep = "\n")
pp <- scan("ex.data", skip = 1, quiet = TRUE)
mydata <- scan("ex.dat", what = list("", 0, 0))#比table灵活，能指定读取数据后的数据类型

cat(file="te.dat", "123456", "987654", sep = "\n")
read.fwf("te.dat", widths = c(1,2,3))
read.fwf("te.dat", widths = c(1,0, 2,3))

#读取csv文件(base包中，故不用导包)
read.csv("custMg.csv",header = FALSE)
read.csv("custMg.csv",sep = ",",header = FALSE, quote = "\"", dec = ".", fill = TRUE, comment.char = "")

#读取spss文件，（在foreign包中需导包）
library("foreign", lib.loc="D:/Program Files/R/R-3.3.2/library")
read.spss()
#读取SAS文件，（在foreign包中需导包）
read.ssd()
#读取Minitab文件（在foreign包中需导包）
read.mtp()
#读取Stata文件（在foreign包中需导包）
read.dta()
#读取systat文件（在foreign包中需导包）
read.systat()

#读取数据库文件(需要RODBC的包)
library("RODBC")
#通过一个数据源名称（mysql）和用户名（root）以及密码（root，如果没有设置，可以直接忽略）打开了一个ODBC数据库连接
mycon <- odbcConnect("mysql", uid = "root", pwd = "root")
data(USArrests) #加载原有数据集
sqlSave(mycon, USArrests, rownames = "state", append = TRUE)  #保存
sqlFetch(mycon, "USArrests", rownames = "state")  # 输出USArrests表中的内容
sqlQuery(mycon, "select * from USArrests")  # 对USArrests表执行了SQL语句select，并将结果输出
sqlDrop(mycon, "USArrests")  #删除表
close(mycon)  # 关闭连接


#读取hadoop文件


#读取剪贴板
y <- read.table("clipboard")



####################爬取数据##############################






####################生成数据##############################

#整数序列
x <- 1:30
x <- 1:30-1  #:优先级要高于-
x <- 1:(30-1)

#等差数列
seq(1,5,0.5)
#普通向量
c(1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5)
#重复序列
rep(1, 30)
sequence(4:5)
sequence(c(10,5))
gl(3, 5)
expand.grid(h=c(60,80), w=c(100, 300), sex=c("Male", "Female"))

#字母序列
letters[1:30]





####################遇到的问题##############################
#
#   1.读取txt文件时的参数设置
#   2.txt文件最后一行加回车时读取文件不会保错，没有回车报错但不影响数据的读取。
#   2.读取mysql时用RODBC和驱动安装,RODBC驱动的安装
#   3.读取mysql时用RMYSQL需依赖DBI
#   4.读取mysql时用RMYSQL时报10060错误
#   5.读取hadoop时需要Rjava,rmr,rhdfs,rhbase的包
#   6.读取excel2007时实际上是把其看作了一个数据库，里面的sheet页看作了一张表。其也需要RODBC的支持





