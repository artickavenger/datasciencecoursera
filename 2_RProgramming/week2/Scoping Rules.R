# Scoping Rules
make.power <- function(n){
  pow <- function(x){
    x^n
  }
  pow
}

cube <- make.power(3)
square <- make.power(2)
cube(3)
square(3)

# Exploring a Function Closure
ls(environment(cube))
get("n", environment(cube))

ls(environment(square))
get("n", environment(square))

# Lexical vs Dynamic Scoping
y <- 10

f <- function(x){
  y <- 2
  y^2+ g(x)
}

g <- function(x){
  x^y
}

f(3) # 59053

## Another example
g <- function(x){
  a <-3
  x+a+y
}
g(2) # object 'y' not found
y <- 3
g(2)
