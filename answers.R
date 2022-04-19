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
143 engine shape (column \"vs\")")
printf("   ANSWER :")
gV = c(mean(mtcars[mtcars$vs==0,]$disp), mean(mtcars[mtcars$vs==1,]$disp))
barplot(gV, names=c("0","1"), axes=TRUE, ylim=c(0,max(gV)*1.2), ylab="mean disp", xlab="vs")
printf("")
printf("")


####################
# Question 3 : 
printf("Add a new column of some sort to the data frame you made in question 3 and assign the output a new variable")
printf("   ANSWER :")
printf("")
printf("")


####################
# Question 3 : 
printf("Add a new column of some sort to the data frame you made in question 3 and assign the output a new variable")
printf("   ANSWER :")
printf("")
printf("")
