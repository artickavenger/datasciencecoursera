# Factors
x <- factor(c('yes', 'no', 'yes', 'no'))
x
table(x)
unclass(x)

# Order of the levels can bbe set using levels argument to factor()
x <- factor(c('yes', 'no', 'yes', 'no'),
            levels = c('yes', 'no'))
x
