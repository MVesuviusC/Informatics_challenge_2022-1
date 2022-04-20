# Author : Ali Snedden
# Date   : 2022-04-19
# Purpose: These are my answers to the 2022 Bioinformatics Challenge
# License: MIT
#
#
#
#
printf <- function(...){
    cat(sprintf(...))
    cat("\n")
}

####################
# Question 1 : 
printf("1. Make a numeric vector at least three elements long")
printf("   ANSWER :")
a <- c(0,1,2)
printf("        is.vector(a) = %s", is.vector(a))
printf("")
printf("")


####################
# Question 2 : 
printf("2. Make a named list object where the values are 10, 15, 20 and 25 and the")
printf("   names of the elements are 'Billy', 'Eli', 'Ali' and 'Jordan'")
printf("   ANSWER :")
a <- list(10,15,20,25)
names(a) <- c("Billy", "Eli", "Ali", "Jordan")
printf("        is.list(a) = %s", is.list(a))
printf("        names(a) : %s %s %s %s",names(a[1]), names(a[2]), names(a[3]),
                names(a[4]))
printf("")
printf("")



####################
# Question 3 : 
printf("3. Make a data frame where one column is random foods and the second column is made-up calorie values")
printf("   ANSWER :")
df <- data.frame(c('ice cream','rice','thousand year egg'), c(1000,642,666), stringsAsFactors=FALSE)
colnames(df)<-c("food", "calories")
printf("        is.data.frame(df) = %s", is.data.frame(df))
print(df)
printf("")
printf("")



####################
# Question 4 : 
printf("4. Add a new column of some sort to the data frame you made in question 3 and assign the output a new variable")
printf("   ANSWER :")
df$flavor = c('tasty','tasty','yuck')
dfnew <- df
print(dfnew)
printf("")
printf("")


####################
# Question 5 : 
printf("5. Remove the column you just added and assign this to a new variable")
printf("   ANSWER :")
dfnew2<-dfnew[1:2]
print(dfnew2)
printf("")
printf("")


####################
# Question 6 : 
printf("6. Using the mtcars data, make a scatterplot of displacement (disp) vs mpg")
printf("   ANSWER :")
#png("images/q6.png")
plot(x=mtcars$mpg, y=mtcars$disp)
#dev.off()
printf("")
printf("")


####################
# Question 7 : 
printf("7. Using the mtcars data again, make a boxplot of hp separated by cyl")
printf("   ANSWER :")
#png("images/q7.png")
boxplot(hp ~ cyl, mtcars)
#dev.off()
printf("")
printf("")


####################
# Question 8 : 
printf("Using the mtcars data again, make a barplot of displacement (disp) for each
engine shape (column \"vs\")")
printf("   ANSWER :")
# png("images/q8.png")
gV = c(mean(mtcars[mtcars$vs==0,]$disp), mean(mtcars[mtcars$vs==1,]$disp))
barplot(gV, names=c("0","1"), axes=TRUE, ylim=c(0,max(gV)*1.2), ylab="mean disp", xlab="vs")
#dev.off()
printf("")
printf("")


####################
# Question 23 : 
printf("Using the mtcars data, make a plot of mpg vs disp, coloring the points by cyl. Include a title. Be sure the colors used are color-blind friendly.")
printf("   ANSWER :")
printf("        p-value = %e", t.test(disp ~ vs, mtcars)[[3]])
#png("images/q23.png")
cyl4 <- mtcars[mtcars$cyl == 4,]
cyl6 <- mtcars[mtcars$cyl == 6,]
cyl8 <- mtcars[mtcars$cyl == 8,]
plot(x=cyl4$disp, y=cyl4$mpg, main="MPG vs Engine Displacement", xlab="Engine Displacement", ylab="MPG", col=c("black"), pch=c(17), cex=c(1.5), xlim=c(0,max(mtcars$disp)), ylim=c(0, max(mtcars$mpg)))
points(x=cyl6$disp, y=cyl6$mpg, col="blue", pch=18, cex=1.5)
points(x=cyl8$disp, y=cyl8$mpg, col="red", pch=19, cex=1.5)
#dev.off()
printf("")
printf("")


####################
# Question 24 : 
printf("From the previous plot, include a legend for point colors and make the
title of the legend 'Cylinder'.")
printf("   ANSWER :")
#png("images/q24.png")
cyl4 <- mtcars[mtcars$cyl == 4,]
cyl6 <- mtcars[mtcars$cyl == 6,]
cyl8 <- mtcars[mtcars$cyl == 8,]
plot(x=cyl4$disp, y=cyl4$mpg, main="MPG vs Engine Displacement", xlab="Engine Displacement", ylab="MPG", col=c("black"), pch=c(17), cex=c(1.5), xlim=c(0,max(mtcars$disp)), ylim=c(0, max(mtcars$mpg)))
points(x=cyl6$disp, y=cyl6$mpg, col="blue", pch=18, cex=1.5)
points(x=cyl8$disp, y=cyl8$mpg, col="red", pch=19, cex=1.5)
lab4 <- sprintf("4 cylinder")
lab6 <- sprintf("6 cylinder")
lab8 <- sprintf("8 cylinder")
legend("topright", c(lab4, lab6, lab8), pch=c(17,18,19), col=c("black","blue","red"),title="Cylinder")
#dev.off()
printf("")
printf("")



####################
# Question 25 : 
printf("Add a linear regression line to the plot along with text in the plot providing the Pearson's correlation and the *p*-value")
printf("   ANSWER :")
#png("images/q25.png")
cyl4 <- mtcars[mtcars$cyl == 4,]
cyl6 <- mtcars[mtcars$cyl == 6,]
cyl8 <- mtcars[mtcars$cyl == 8,]
plot(x=cyl4$disp, y=cyl4$mpg, main="MPG vs Engine Displacement", xlab="Engine Displacement", ylab="MPG", col=c("black"), pch=c(17), cex=c(1.5), xlim=c(0,max(mtcars$disp)), ylim=c(0, max(mtcars$mpg)))
points(x=cyl6$disp, y=cyl6$mpg, col="blue", pch=18, cex=1.5)
points(x=cyl8$disp, y=cyl8$mpg, col="red", pch=19, cex=1.5)
lab4 <- sprintf("4 cylinder")
lab6 <- sprintf("6 cylinder")
lab8 <- sprintf("8 cylinder")

mtfit <- lm(mpg ~ disp, mtcars)
df <- data.frame(mtcars$disp)
colnames(df)<-c("disp")
lines(df$disp, predict(mtfit,df), col="black", lty=1, lwd=3)
pearcor <- cor(data.frame(mtcars$disp,mtcars$mpg),method="pearson")[2,1]
pvalue <- t.test(df$disp,df$mpg)$p.value      # Wouldn't make sense any other way
labfit <- sprintf("fit : Pearson Corr = %.4f\n pvalue=%.3e",pearcor, pvalue)
legend("topright", c(lab4, lab6, lab8, labfit), pch=c(17,18,19,NA), lty=c(NA,NA,NA,1), lwd=c(NA,NA,NA,3), col=c("black","blue","red"),title="Cylinder", cex=c(0.9,0.9,0.9,0.9))
#dev.off()
printf("")
printf("")
