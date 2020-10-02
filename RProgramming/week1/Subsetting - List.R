# Subsetting lists
x <- list(foo = 1:4, bar = 0.6)
x
x[1]
x[[1]]
x$bar
x[['bar']]
x['bar']

x <- list(foo = 1:4, bar= 0.6, baz = 'hello')
x[c(1,3)]

x <- list(foo = 1:4, bar= 0.6, baz = 'hello')
name <- 'foo'
x[[name]] ## computed index for foo
x$name ## element name doesn't exist
x$foo ## element foo does exist

x <- list(a = list(10, 12, 14), b = c(3.14, 2.81))
x
x[[1]][[3]] # 14
x[[c(2,1)]] # 3.14
x[[c(1,3)]] # 14
