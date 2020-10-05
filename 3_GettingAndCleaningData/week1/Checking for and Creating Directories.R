# Checking for and creating directories
if (!file.exists("GettingAndCleaningData/")) {
        dir.create("GettingAndCleaningData/")
}

## download.file to get data from internet
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "GettingAndCleaningData/week1/camera.csv", method = "curl")
list.files("GettingAndCleaningData/week1/")
## [1] "camera.csv"

dateDownloaded <- date()
dateDownloaded
## [1] "Sun Oct  4 07:13:53 2020"