library(tidyverse)
library(datasets)
data(iris)
?iris

iris_vir <- iris %>% 
        filter(Species == "virginica")
mean(iris_vir$Sepal.Length)
tapply(iris$Sepal.Length, iris$Species, mean)

apply(iris[,1:4], 2, mean)

data(mtcars)
tapply(mtcars$mpg, mtcars$cyl, mean)
tapply(mtcars$cyl, mtcars$mpg, mean)
with(mtcars,tapply(mpg, cyl, mean))

cyl_8 <- tapply(mtcars$hp, mtcars$cyl==8, mean)
cyl_8[2]
cyl_4 <- tapply(mtcars$hp, mtcars$cyl==4, mean)
cyl_4[2]
abs_diff = cyl_8[2] - cyl_4[2]
abs_diff

cyl_hp <- tapply(mtcars$hp, mtcars$cyl, mean)
cyl_hp[3] - cyl_hp[1]
debug(ls)
ls
