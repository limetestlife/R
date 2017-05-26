#查看内部数据集
data()
#查看有哪些颜色可用
colors()
#查看R图形demo
demo( graphics )

#热力图
heatmap(as.matrix(mtcars),
        main = "汽车数据集热力图",
        col=heat.colors(256),
        Rowv = NA,
        Colv = NA,
        scale = "column",
        margins=c(2,8)
        )
iris
#向日葵散点图,用来克服散点图中数据点重叠问题,在有重叠的地方用一朵“向日葵花”的花瓣数目来表示重叠数据的个数
sunflowerplot(iris[, 3:4], col ="gold", seg.col = "gold")

#散点图集,可以看出各个变量之间是否有关系
#方法一
pairs(iris[,1:4])
#方法二
plot(iris[,1:4],
     main="Relationships between
     characteristics of iris flowers",
     pch=19,
     col="blue",
     cex=0.9)


par(mfrow=c(3,1))
plot(x1,x2);plot(x2,x3);plot(x3,x1)





