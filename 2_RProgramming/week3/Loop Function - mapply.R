# Loop Functions - mapply
str(mapply)

list(rep(1, 4), rep(2, 3), rep(3, 2), rep(4, 1))

mapply(rep, 1:4, 4:1)

noise <- function(n, mean, sd){
        rnorm(n, mean, sd)
}

noise(5, 1, 2)

noise(1:5, 1:5, 2)

mapply(noise, 1:5, 1:5, 2)

list(noise(1,1,2), noise(2,2,2), noise(3,3,2),
     noise(4,4,2), noise(5,5,2))
