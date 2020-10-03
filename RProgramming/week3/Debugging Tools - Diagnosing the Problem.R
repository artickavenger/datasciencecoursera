# Debugging Tools - Diagnosing the Problem
log(-1)
## Warning message:
##        In log(-1) : NaNs produced

printmessage <- function(x){
        if(x > 0)
                print("x is greater than zero")
        else
                print("x is less that or equal to zero")
        invisible(x)
}
## Error: missing value where TRUE/FALSE needed

printmessage2 <- function(x){
        if(is.na(x))
                print("x is a missing value")
        else if(x > 0)
                print("x is greater than zero")
        else
                print("x is less that or equal to zero")
        invisible(x)
}
x <- log(-1)
## Warning message:
##      In log(-1) : NaNs produced
printmessage2(x)
## [1] "x is a missing value"

