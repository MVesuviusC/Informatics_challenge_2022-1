dev.off()
#png("q33.png")
par(mar=c(1,1,1,1))
# Central scatter plot
par(fig=c(0.1,0.7,0.1,0.7))
plot(mtcars$mpg, mtcars$disp, pch=c(16), xlim=c(10,37), ylim=c(30,520))
# Right histogram
par(fig=c(0.72,0.95,0.1,0.7), new=TRUE)
tmp<-hist(mtcars$disp, breaks=seq(30,520,1), plot=FALSE)
barplot(tmp$counts, axes=FALSE, space=0, horiz=TRUE, ylim=c(30,520))
Axis(side=2, labels=TRUE, at=c(100,200,300,400,500))
axis(side=1, tick=TRUE, at=c(1,2,3), labels=FALSE)
box(col="black")
# Top histogram
par(fig=c(0.1,0.7,0.71,0.9), new=TRUE)
hist(mtcars$mpg, main="", xlim=c(10,37), breaks=150)
box(col="black")
