# Using system.time
## Elapsed time > user time
system.time(readLines("http://www.jhsph.edu"))
### user  system elapsed 
### 0.045   0.032  15.264 

## Elapsed time < user time
hilbert <- function(n){
        i <- 1:n
        1/ outer(i -1, i, "+")
}

x <- hilbert(1000)
system.time(svd(x))
### user  system elapsed 
### 3.491   0.000   3.512

system.time({
        n <- 1000
        r <- numeric(n)
        for (i in 1:n) {
                x <- rnorm(n)
                r[i] <- mean(x)
        }
})
### user  system elapsed 
### 0.077   0.000   0.077 