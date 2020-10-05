# Reading XML
## Read the file into R
library(XML)
fileURL <- "https://www.w3schools.com/xml/simple.xml"
doc <- xmlTreeParse("data/menu.xml", useInternal=TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)

names(rootNode)

## Directly access parts of the XML document
rootNode[[1]]

rootNode[[1]][[1]]

## Programatically extracts parts of the file
xmlSApply(rootNode, xmlValue)

## Get the items on the menu and prices
xpathSApply(rootNode,"//name", xmlValue)

xpathSApply(rootNode,"//price", xmlValue)

##Extract content by attributes
fileURL <- "https://espn.go.com/nfl/team/_/name/bal/baltimore-ravens"
doc <- htmlTreeParse(fileURL, useInternal=TRUE)
scores <- xpathSApply(doc, "//li[@class='score']", xmlValue)
teams <- xpathSApply(doc,"//li[@class='team-name']", xmlValue)
