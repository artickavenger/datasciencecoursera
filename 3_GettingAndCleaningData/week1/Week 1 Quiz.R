# Downloading Files 
if(!file.exists("data")){dir.create("data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile="data/2Fss06hid.csv", method = "curl")
dateDownloaded <- date()

hid <- read.csv("data/2Fss06hid.csv")
head(hid)

summary(hid$VAL)

tapply(hid$VAL, hid$VAL==24, length)


fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx "
download.file(fileUrl, destfile="data/NGAP.xlsx", method = "curl")
dateDownloaded <- date()

library(xlsx)
col <- 7:15
row <- 18:23
dat <- read.xlsx("data/NGAP.xlsx", sheetIndex = 1, colIndex = col, rowIndex = row)
dat
sum(dat$Zip*dat$Ext,na.rm=T)

library(XML)
library(RCurl)
fileUrl3 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
BalResto <- xmlTreeParse(sub("s", "", fileUrl3), useInternal=TRUE)
rootNode <- xmlRoot(BalResto)
names(rootNode)

zip <- xpathSApply(rootNode, "//zipcode", xmlValue)
sum(zip == 21231)



fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl, destfile="data/2Fss06pid.csv", method = "curl")
dateDownloaded <- date()

DT <- read.csv("data/2Fss06pid.csv")

DT[,mean(pwgtp15),by=SEX]
mean(DT[DT$SEX==1,]$pwgtp15);mean(DT[DT$SEX==2,]$pwgtp15)
sapply(split(DT$pwgtp15, DT$SEX), mean)
rowMeans(DT)[DT$SEX==1];rowMeans(DT)[DT$SEX==2]
tapply(DT$pwgtp15, DT$SEX, mean)
mean(DT$pwgtp15,by=DT$SEX)
