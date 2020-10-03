# Loop Functions - apply
str(apply)

x <- matrix(rnorm(200), 20, 10)
apply(x, 2, mean)

apply(x, 1, mean)

apply(x, 1, quantile, probs = c(0.25, 0.75))

a <- array(rnorm(2 * 2 * 10), c(2, 2, 10))
apply(a, c(1, 2), mean)

rowMeans(a, dims = 2)

