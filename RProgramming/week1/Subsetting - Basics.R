# Subsetting
x <- c('a', 'b', 'c', 'c', 'd', 'a')
x[1]
x[2]
x[1:4]

# logical indexing
x[x > 'a']
u <- x > 'a'
u
x[u]
