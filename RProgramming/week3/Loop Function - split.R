# Loop Function - split
str(split)

x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
split(x, f)

lapply(split(x, f), mean)

library(datasets)
head(airquality)

s <- split(airquality, airquality$Month)
lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))

sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))

sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = TRUE))

x <- rnorm(10)
f1 <- gl(2,5)
f2 <- gl(5,2)

f1
f2
interaction(f1, f2)

str(split(x, list(f1, f2))) # create empty levels

str(split(x, list(f1, f2), drop = TRUE))
