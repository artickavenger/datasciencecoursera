# Creating Vectors
x <- c(0.5, 0.6) ## Numeric
x <- c(TRUE, FALSE) ## Logical
x <- c(T, F) ## Logical
x <- c("a", "b", "c") ## Character
x <- 9:29 ## Integer
x <- c(1+0i, 2+4i) ## Complex

# Using the vector() function
x <- vector('numeric', length = 10)
x

# Missing Objects
y <- c(1.7, 'a') ## Character
y <- c(TRUE, 2) ## Numeric
y <- c('a', TRUE) ## Character

# Explicit Coercion
x <- 0:6
class(x)
as.numeric(x)
as.logical(x)
as.character(x)

# Coercion not always work
x <- c('a', 'b', 'c')
as.numeric(x)
as.logical(x)
as.complex(x)

# List
x <- list(1, 'a', TRUE, 1+4i)
x
