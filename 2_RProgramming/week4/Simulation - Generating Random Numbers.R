# Simulation - Generating Random Numbers
x <- rnorm(10)
x

x <- rnorm(10, 20, 2)
x

summary(x)

set.seed(1)
rnorm(5)
rnorm(5)
rnorm(5)

rpois(10, 1)

rpois(10, 2)

rpois(10, 20)

ppois(2,2) ## Cumulative distribution
## 0.6766764 ## Pr (x <= 2)
ppois(4, 2)
## 0.947347 ## Pr (x <= 4)
ppois(6, 2)
## 0.9954662 ## Pr (x <= 6)