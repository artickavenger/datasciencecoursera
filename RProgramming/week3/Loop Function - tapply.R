# Loop Function tapply

str(tapply)

x <- c(rnorm(10), runif(10), rnorm(10,1))
f <- gl(3, 10)

tapply(x, f, mean)

tapply(x, f, mean, simplify = FALSE)

tapply(x, f, range)
