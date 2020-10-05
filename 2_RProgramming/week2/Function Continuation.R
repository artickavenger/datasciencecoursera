# Function Part 1

## Argument Matching
mydata <- rnorm(100)
sd(mydata)
sd(x = mydata, na.rm = FALSE)
sd(na.rm = FALSE, x = mydata)
sd(na.rm = FALSE, mydata)

# Defining a Function
f<- function(a, b = 1, c = 2, d = NULL){
  
}

# Lazy Evaluation
f <- function(a, b){
  a*2
}
f(2)

f2 <- function(a, b){
  print(a)
  print(b)
}
f2(45)

# The "..." Argument
myplot <- function(x ,y, type = "l", ...){
  plot(x, y, type = type, ...)
}

x1 <- 1:20
y1 <- 21:40

myplot(x1, y1)

