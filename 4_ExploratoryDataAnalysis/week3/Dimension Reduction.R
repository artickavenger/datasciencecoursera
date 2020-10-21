# Dimension Reduction

## Matrix Data
set.seed(12345)
par(mar = rep(0.2, 4))
dataMatrix <- matrix(rnorm(400), nrow = 40)
image(1:10, 1:40, t(dataMatrix)[, nrow(dataMatrix):1])

## Cluster the Data
par(mar = rep(0.2,4))
heatmap(dataMatrix)

## Add a pattern
set.seed(678910)
for (i in 1:40) {
        # flip a coin
        coinFlip <- rbinom(1, size = 1, prob = 0.5)
        # if coin is heads add a common pattern to that row
        if (coinFlip) {
                dataMatrix[i, ] <- dataMatrix[i, ] + rep(c(0,3), each = 5)
        }
}

## Plot again the data
par(mar = rep(0.2,4))
image(1:10, 1:40, t(dataMatrix)[, nrow(dataMatrix):1])

par(mar = rep(0.2,4))
heatmap(dataMatrix)

## Patterns in rows and columns
hh <- hclust(dist(dataMatrix))
dataMatrixOrder <- dataMatrix[hh$order, ]
par(mfrow = c(1,3))
image(t(dataMatrixOrder)[, nrow(dataMatrixOrder):1])
plot(rowMeans(dataMatrixOrder), 40:1, xlab = "Row Mean", ylab = "Row", pch = 19)
plot(colMeans(dataMatrixOrder), xlab = "Column", ylab = "Column Mean", pch = 19)

## Components of the SVD - u and v
svd1 <- svd(scale(dataMatrixOrder))
par(mfrow = c(1,3))
image(t(dataMatrixOrder)[, nrow(dataMatrixOrder):1])
plot(svd1$u[, 1], 40:1, ,xlab = "Row", ylab = "First left singular vector", pch = 19)
plot(svd1$v[, 1], xlab = "Column", ylab = "First right singular vector", pch = 19)

## Components of the SVD - Variance explained
par(mfrow = c(1,2))
plot(svd1$d, xlab = "Column", ylab = "Singular value", pch = 19)
plot(svd1$d^2/sum(svd1$d^2), xlab = "Column", ylab = "Prop. of vaiance explained", pch = 19)

## Relationshop to principal components
svd1 <- svd(scale(dataMatrixOrder))
pca1 <- prcomp(dataMatrixOrder, scale. = TRUE)
plot(pca1$rotation[,1], svd1$v[,1], pch = 19, xlab = "Principal Component 1", ylab = "Right Singular Vector 1")
abline(c(0,1))

## Components of the SVD - Variance explained
constantMatrix <- dataMatrixOrder*0
for (i in 1:dim(dataMatrixOrder)[1]) {constantMatrix[i,] <- rep(c(0,1), each=5)}
svd1 <- svd(constantMatrix)
par(mfrow = c(1,3), mar = c(2,2,1,1))
image(t(constantMatrix)[,nrow(constantMatrix):1])
plot(svd1$d, xlab = "Column", ylab = "Singular value", pch = 19)
plot(svd1$d^2/sum(svd1$d^2), xlab = "Column", ylab = "Prop. of variance explained", pch=19)

## Add second pattern
set.seed(678910)
for (i in 1:40) {
        # flip a coin
        coinFlip1 <- rbinom(1, size = 1, prob = 0.5)
        coinFlip2 <- rbinom(1, size = 1, prob = 0.5)
        # if coin is head add a common pattern to that row
        if (coinFlip1) {
                dataMatrix[i, ] <- dataMatrix[i, ] + rep(c(0,5),each = 5)
        }
        if (coinFlip2) {
                dataMatrix[i, ] <- dataMatrix[i, ] + rep(c(0,5), 5)
        }
}
hh <- hclust(dist(dataMatrix))
dataMatrixOrder <- dataMatrix[hh$order, ]

## Singular value decomposition - true patterns
svd2 <- svd(dataMatrixOrder)
par(mfrow = c(1,3), mar = c(3,3,1,1))
image(t(dataMatrixOrder)[, nrow(dataMatrixOrder):1])
plot(rep(c(0,1), each = 5), pch = 19, xlab = "Column", ylab = "Pattern 1")
plot(rep(c(0,1), 5), pch = 19, xlab = "Column", ylab = "Pattern 2")

## d and variance explained
svd1 <- svd(scale(dataMatrixOrder))
par(mfrow = c(1,2))
plot(svd1$d, xlab = "Column", ylab = "Singular value", pch = 19)
plot(svd1$d^2/sum(svd1$d^2), xlab = "Column", ylab = "Percent of variance explained", pch = 19)

## Missing Values
dataMatrix2 <- dataMatrixOrder
## Randomly insert some missing data
dataMatrix2[sample(1:100, size = 40, replace = FALSE)] <- NA
svd1 <- svd(scale(dataMatrix2)) ## Doesn't work!

## Imputing {impute}
library(impute)
dataMatrix2 <- dataMatrixOrder
dataMatrix2[sample(1:100, size = 40, replace = FALSE)] <- NA
dataMatrix2 <- impute.knn(dataMatrix2)$data
svd1 <- svd(scale(dataMatrixOrder)); svd2 <- svd(scale(dataMatrix2))
par(mfrow=c(1,2)); plot(svd1$v[,1], pch=19); plot(svd2$v[,1], pch=19)

## Face example
load("data/face.rda")
image(t(faceData)[, nrow(faceData):1])

## Face example - variance explained
svd1 <- svd(scale(faceData))
plot(svd1$d^2/sum(svd1$d^2), pch=19, xlab = "Singular vector", ylab = "Variance explained")

## Face example - create approximations
svd1 <- svd(scale(faceData))
## Note that %*% is matrix multiplication

## Here svd1$d[1] is a constant
approx1 <- svd1$u[,1] %*% t(svd1$v[,1]) * svd1$d[1]

## In these examples we need to make the diagonal matrix out of d
approx5 <- svd1$u[,1:5] %*% diag(svd1$d[1:5]) %*% t(svd1$v[,1:5])
approx10 <- svd1$u[,1:10] %*% diag(svd1$d[1:10]) %*% t(svd1$v[,1:10])

par(mfrow = c(1,4), mar = c(2,2,1,1))
image(t(approx1)[, nrow(approx1):1], main = "(a)")
image(t(approx5)[, nrow(approx5):1], main = "(b)")
image(t(approx10)[, nrow(approx10):1], main = "(c)")
image(t(faceData)[, nrow(faceData):1], main = "(d)") ## Original

