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
printf("        a <- c(0,1,2)")
a <- c(0,1,2)
printf("        is.vector(a) = %s", is.vector(a))
printf("\n")


####################
# Question 2 : 
printf("2. Make a named list object where the values are 10, 15, 20 and 25 and the
           names of the elements are 'Billy', 'Eli', 'Ali' and 'Jordan'")
printf("   ANSWER :")
printf("        a <- list(10,15,20,25)")
printf("        names(a) <- c(\"Billy\", \"Eli\", \"Ali\", \"Jordan\")")
a <- list(10,15,20,25)
names(a) <- c("Billy", "Eli", "Ali", "Jordan")
printf("        is.list(a) = %s", is.list(a))
printf("        names(a) = %s", lapplynames(a))
