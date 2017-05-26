#####################数据类型###############################
#   常用数据类型
#   1 字符（ charactor ） 它们常常被引号包围
#   2 数字（ numeric ） 实数向量
#   3 整数（ integer ） 整数向量
#   4 逻辑（ logical ） 逻辑向量（ TRUE=T 、 FALSE=F ）
#   5 复数（ complex ） 复数 a
#   6 列表（ list ） S 对象的向量
#   7 因子（ factor ） 常用于标记样本
#
#
#1.基本数据类型：
#    numberic 数值型,logical 逻辑型,character 字符型,NA 缺省值,double 双精度,complex,integer 整数型,日期型
#
#   2.日期变量：日期值通常以字符串的形式传入R然后再转化为日期变量
#   常用函数如下：
#     Sys.Date()    返回系统当前日期
#     Sys.time()    返回系统当前日期和时间,返回POSIXct类型
#     date()        返回系统当前日期和时间，返回的是character类型
#     as.POSIXct(mydata,)
#
#
#
############################################################




Sys.Date()
mydata <- Sys.time()
mydata <- date()
as.POSIXct(mydata,)
(as.Date(mydata,"%m/%d/%Y"))
