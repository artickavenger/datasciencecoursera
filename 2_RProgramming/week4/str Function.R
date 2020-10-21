# The str Function
str(str)
str(lm)
str(ls)
x <- rnorm(100,2, 4)
summary(x)
str(x)

f <- gl(40, 10)
str(f)
summary(f)

library(datasets)
head(airquality)

str(airquality)

m <- matrix(rnorm(100),10,10)
str(m)
m[,1]

s <- split(airquality, airquality$Month)
s
