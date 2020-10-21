# Peer-graded Assignment: Course Project 2

## Load Required Package
library(ggplot2)
library(RColorBrewer)

## Download and unzip the file:
dir.create("./air_pollution")
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(url, destfile = "./air_pollution.zip" )
unzip("./air_pollution.zip", exdir = "./air_pollution" )

## Load the data:
NEI <- readRDS("./air_pollution/summarySCC_PM25.rds")
SCC <- readRDS("./air_pollution/Source_Classification_Code.rds")

## Check content of the dataframe
head(NEI)
head(SCC)
str(NEI)
str(SCC)

## --------------------------------------------------------------------------
## 1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
##    Using the base plotting system, make a plot showing the total PM2.5 emission from 
##    all sources for each of the years 1999, 2002, 2005, and 2008.
## --------------------------------------------------------------------------
totalNEI <- aggregate(Emissions ~ year, NEI, sum)

plot(totalNEI$year, totalNEI$Emissions, type = "o", col = "steelblue3", main = 
             expression("Total US "~ PM[2.5]~ "Emissions by Year"), ylab = 
             expression("Total US "~   PM[2.5] ~ "Emissions"), xlab = "Year")


## Save file, create plot1.png, and close the device
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()
## ----------------------------------------------------------------------------
## 2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == “24510”) 
##    from 1999 to 2008? Use the base plotting system to make a plot answering this question.
## ----------------------------------------------------------------------------
baltimore <- subset(NEI, NEI$fips == "24510")

totalBaltimore <- aggregate(Emissions ~ year, baltimore, sum)

plot(totalBaltimore$year, totalBaltimore$Emissions, type = "o", main = 
             expression("Total Baltimore" ~ PM[2.5] ~ "Emissions by Year"), xlab = "Year", ylab = 
             expression("Total Baltimore "~ PM[2.5] ~ "Emissions"), col = "steelblue3")

## Save file, create plot1.png, and close the device
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()

## ------------------------------------------------------------------------------
## 3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
##    which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
##    Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make 
##    a plot answer this question. library(ggplot2)
## -------------------------------------------------------------------------------

baltimore <- subset(NEI, NEI$fips == "24510")
baltimoreType <- aggregate(Emissions ~ year + type, baltimore, sum)

ggplot(baltimoreType, aes(year, Emissions, col = type)) +
        geom_line() +
        geom_point() +
        ggtitle(expression("Total Baltimore " ~ PM[2.5] ~ "Emissions by Type and Year")) +
        ylab(expression("Total Baltimore " ~ PM[2.5] ~ "Emissions")) +
        xlab("Year") +
        scale_colour_discrete(name = "Type of sources") +
        theme(legend.title = element_text(face = "bold"))

## Save file, create plot1.png, and close the device
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()

## -------------------------------------------------------------------------------
## 4. Across the United States, how have emissions from coal combustion-related sources 
##    changed from 1999-2008?
## -------------------------------------------------------------------------------

SCCcoal <- SCC[grepl("coal", SCC$Short.Name, ignore.case = T),]
NEIcoal <- NEI[NEI$SCC %in% SCCcoal$SCC,]
totalCoal <- aggregate(Emissions ~ year + type, NEIcoal, sum)

ggplot(totalCoal, aes(year, Emissions, col = type)) +
        geom_line() +
        geom_point() +
        ggtitle(expression("Total US" ~ PM[2.5] ~ "Coal Emission by Type and Year")) +
        xlab("Year") +
        ylab(expression("US " ~ PM[2.5] ~ "Coal Emission")) +
        scale_colour_discrete(name = "Type of sources") +
        theme(legend.title = element_text(face = "bold"))

## Save file, create plot1.png, and close the device
dev.copy(png,"plot4.png", width=480, height=480)
dev.off()

## -------------------------------------------------------------------------------
## 5. How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
## -------------------------------------------------------------------------------

baltimoreMotor <- subset(NEI, NEI$fips == "24510" & NEI$type == "ON-ROAD")
baltimoreMotorAGG <- aggregate(Emissions ~ year, baltimoreMotor, sum)

ggplot(baltimoreMotorAGG, aes(year, Emissions)) +
        geom_line(col = "steelblue3") +
        geom_point(col = "steelblue3") +
        ggtitle(expression("Baltimore " ~ PM[2.5] ~ "Motor Vehicle Emissions by Year")) +
        xlab("Year") +
        ylab(expression(~PM[2.5]~ "Motor Vehicle Emissions"))

## Save file, create plot1.png, and close the device
dev.copy(png,"plot5.png", width=480, height=480)
dev.off()

## ----------------------------------------------------------------------------------
## 6. Compare emissions from motor vehicle sources in Baltimore City with emissions 
##    from motor vehicle sources in Los Angeles County, California (fips == “06037”). 
##    Which city has seen greater changes over time in motor vehicle emissions?
## -----------------------------------------------------------------------------------

baltLosAngelesMotors <- subset(NEI, NEI$fips %in% c("24510","06037") & NEI$type == "ON-ROAD")
baltLosAngelesMotorsAGG <- aggregate(Emissions ~ year + fips, baltLosAngelesMotors, sum)

ggplot(baltLosAngelesMotorsAGG, aes(year, Emissions, col = fips)) +
        geom_line() +
        geom_point() +
        ggtitle(expression("Baltimore and Los Angeles" ~ PM[2.5] ~ "Motor Vehicle Emissions by Year")) +
        labs(x = "Year", y = expression(~PM[2.5]~ "Motor Vehicle Emissions") ) +
        scale_colour_discrete(name = "City", labels = c("Los Angeles", "Baltimore")) +
        theme(legend.title = element_text(face = "bold"))

## Save file, create plot1.png, and close the device
dev.copy(png,"plot6.png", width=480, height=480)
dev.off()
