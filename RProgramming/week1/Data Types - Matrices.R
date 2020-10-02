# Matrices
m <- matrix(nrow = 2, ncol = 3)
dim(m)
attributes(m)


m <- matrix(1:6, nrow = 2, ncol = 3)

# Create Matrix using dimension attribute
m <- 1:10
m
dim(m) <- c(2, 5)
m

# cbind-ing and rbind-ing
x <- 1:3
y <- 10:12
cbind(x, y)
rbind(x, y)
