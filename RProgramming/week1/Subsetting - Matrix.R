# Subsetting Matrix
x <- matrix(1:6, 2, 3)
x
x[1, 2] # 3
x[2, 1] # 2

# indices ca also be missing
x[1,] # 1 3 5, value of first row
x[,1] # 1 2, value of first column

x[1,2] # 3

x[1,2, drop=FALSE] #3, use drop to drop dimension

x[1,]
x[1, , drop=FALSE]
