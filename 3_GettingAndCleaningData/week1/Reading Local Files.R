# Reading Local Files
cameraData <- read.table("GettingAndCleaningData/week1/camera.csv")
## Error: line 2 did not have 8 elements

head(cameraData)
## Error in head(cameraData) : object 'cameraData' not found

## Correct Reading
cameraData <- read.table("GettingAndCleaningData/week1/camera.csv", sep = ",", header = TRUE)
head(cameraData)

## Other method
cameraData <- read.csv("GettingAndCleaningData/week1/camera.csv")
head(cameraData)
