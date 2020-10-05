# Simulation - Random Sampling
set.seed(1)
sample(1:10, 4)
sample(1:10, 4)
sample(letters, 5)
sample(1:10) ## permutation
## [1] 10  6  9  2  1  5  8  4  3  7
sample(1:10nt, replace = TRUE) ## Sample w/ replaceme
## [1]  5  5  2 10  9  1  4  3  6 10