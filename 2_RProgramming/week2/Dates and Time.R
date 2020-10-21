# Dates and Time
x <- as.Date("1970-01-01")
x
unclass(x)
unclass(as.Date("1970-01-02"))

## Times in R
x <- Sys.time()
x
### 2020-10-02 16:23:09 PST"

p <- as.POSIXlt(x)
names(unclass(p))
### [1] "sec"    "min"    "hour"   "mday"  
### [5] "mon"    "year"   "wday"   "yday"  
### [9] "isdst"  "zone"   "gmtoff"

p$sec
### [1] 9.557084

x <- Sys.time()
x ## Already in 'POSTXct' format
### [1] "2020-10-02 16:25:55 PST"
unclass(x)
### [1] 1601627155
x$sec
### Error in x$sec : $ operator is invalid for atomic vectors
p <- as.POSIXlt(x)
p$sec
### [1] 55.3688

## strptime function
datestring <- c("January 10, 2012 10:40", "December 9, 2011 9:10")
x <- strptime(datestring, "%B %d, %Y %H:%M")
x
### [1] "2012-01-10 10:40:00 PST"
### [2] "2011-12-09 09:10:00 PST"
class(x)
### [1] "POSIXlt" "POSIXt"

## Other Examples
x <- as.Date("2012-01-01")
y <- strptime("9 Jan 2011 11:34:21", "%d %b %Y %H:%M:%S")
x - y
### Error in x - y : non-numeric argument to binary operator
### In addition: Warning message:
###         Incompatible methods ("-.Date", "-.POSIXt") for "-" 
x <- as.POSIXlt(x)
x-y
### Time difference of 356.8511 days

x <- as.Date("2012-03-01"); y <- as.Date("2012-02-28")
x - y
### Time difference of 2 days
x <- as.POSIXct("2012-10-25 01:00:00")
y <- as.POSIXct("2012-10-25 06:00:00", tz = "GMT")
y-x
### Time difference of 13 hours