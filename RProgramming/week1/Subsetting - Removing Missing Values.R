# Removing NA Values
x ,- c(1, 2, NA, 4, NA, 5)
bad <- is.na(x)
x[!bad]

# Multiple Object
x <- c(1, 2, NA, 4, NA, 5)
y <- c('a', 'b', NA, 'd', NA, 'f')
good <- complete.cases(x ,y)
good
x[good]
y[good]

airquality[1:6,]
good <- complete.cases(airquality)
airquality[good, ][1:6,]
