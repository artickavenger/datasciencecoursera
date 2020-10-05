# Reading JSON
## Reading JSON files
library(jsonlite)
jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")
names(jsonData)

names(jsonData$owner)

jsonData$owner$login

## Writing data frames to JSON
myjson <- toJSON(iris, pretty = TRUE)
cat(myjson)

## Convert back to JSON
iris2 <- fromJSON(myjson)
head(iris2)

