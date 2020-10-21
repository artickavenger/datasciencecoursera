# Name Attribute
x <- 1:3
names(x)
names(x) <- c('foo', 'bar', 'norf')
x
names(x)

# Matrices
m <- matrix(1:4, nrow = 2, ncol = 2)
dimnames(m) <- list(c('a', 'b'), c('c', 'd'))
m
