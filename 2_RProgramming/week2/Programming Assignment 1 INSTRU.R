# Programming Assignment 1 INSTRU
pollutantmean <- function(directory, pollutant, id = 1:332){
        # create a list of files
        files_full <- list.files(directory, full.names = TRUE)
        # create an empty data frame
        dat <- data.frame()
        for (i in id){
                # add files to main data
                dat <- rbind(dat, read.csv(files_full[i]))
        }
        # Calculate mean
        mean_data <- mean(dat[, pollutant], na.rm = TRUE)
        return(mean_data)
}

pollutantmean("specdata", "sulfate")

complete <- function(directory, id = 1:332){
        # Create a list of file
        files_full <- list.files(directory, full.names = TRUE)
        # Create empty data frame
        dat <- data.frame()
        for (i in id){
                # Read files
                temp <- read.csv(files_full[i])
                # nobs are sum of all complete cases
                nobs <- sum(complete.cases(temp))
                # Enumerates complete cass by index
                dat <- rbind(dat, data.frame(i, nobs))
        }
        colnames(dat) <- c("id", "nobs")
        return(dat)
}
complete("specdata", c(2, 4, 8, 10, 12))

corr <- function(directory, threshold = 0){
        # create list of all files
        files_full <- list.files(directory, full.names = TRUE)
        # create empty data set
        dat <- vector(mode = "numeric", length = 0)
        for (i in 1:length(files_full)) {
                # Read File
                tmp <- read.csv(files_full[i])
                
                # Calculate csum
                csum <- sum((!is.na(tmp$sulfate)) & (!is.na(tmp$nitrate)))
                if (csum > threshold){
                        # Extract data of nitrate and sulfate and calculate correlation between them
                        sul <- tmp[which(!is.na(tmp$sulfate)), ]
                        nit <- sul[which(!is.na(sul$nitrate)), ]
                        dat <- c(dat, cor(nit$sulfate, nit$nitrate))
                }
        }
        dat
}
cr <- corr("specdata", 150)
head(cr)
summary(cr)

cr <- corr("specdata", 400)
head(cr)
summary(cr)

cr <- corr("specdata")
head(cr)
summary(cr)
