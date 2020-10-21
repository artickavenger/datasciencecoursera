# Plotting and Color in R

## Color Utilities in R
pal <- colorRamp(c("red", "blue"))
pal(0)
pal(1)
pal(0.5)

## colorRamp
pal(seq(0,1, len = 10))

## colorRampePallete
pal <- colorRampPalette(c("red", "yellow"))
pal(2)
pal(10)

## RColorBrewer Package
library(RColorBrewer)
cols <- brewer.pal(3, "BuGn")
cols

pal <- colorRampPalette(cols)
image(volcano, col = pal(20))

## SmoothScatter Function
x <- rnorm(10000)
y <- rnorm(10000)
smoothScatter(x, y)
