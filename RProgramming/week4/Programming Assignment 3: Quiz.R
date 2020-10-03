# ProgAssignment3
## 1. Plot the 30-day mortality rates for heart attack 
outcome <- read.csv("rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")
head(outcome)

ncol(outcome) # 46
nrow(outcome) # 4706
names(outcome) # check name of the rows

# Create simple histogram
outcome[, 11] <- as.numeric(outcome[,11])
hist(outcome[,11])


best <- function(state, outcome) {
        
        ## Read outcome data
        outcome1 <- read.csv("rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")
        
        ## Check that state and outcome are valid
        if(!any(state == outcome1$State)){
                stop("invalid state")}
        else if((outcome %in% c("heart attack", "heart failure","pneumonia")) == FALSE) {
                stop(print("invalid outcome"))
        }
        
        ## Return hospital name in that state with lowest 30-day death
        ## rate
        outcome2 <- subset(outcome1, State == state)
        if (outcome == "heart attack") {
                colnum <- 11
        }
        else if (outcome == "heart failure") {
                colnum <- 17
        }
        else {
                colnum <- 23
        }
        min_row <- which(as.numeric(outcome2[ ,colnum]) == 
                                 min(as.numeric(outcome2[ ,colnum]), na.rm = TRUE))
        hospitals <- outcome2[min_row,2]
        hospitals <- sort(hospitals)
        return(hospitals[1])
}

best("SC", "heart attack")
best("NY", "pneumonia")
best("AK", "pneumonia")

rankhospital <- function(state, outcome, rank = "best"){
        ## Read outcome data
        data <- read.csv("routcome-of-care-measures.csv", colClasses = "character")
        fd   <- as.data.frame(cbind(data[, 2],  # hospital
                                    data[, 7],  # state
                                    data[, 11],  # heart attack
                                    data[, 17],  # heart failure
                                    data[, 23]), # pneumonia
                              stringsAsFactors = FALSE)
        colnames(fd) <- c("hospital", "state", "heart attack", "heart failure", "pneumonia")
        
        ## Check that state and outcome are valid
        if (!state %in% fd[, "state"]) {
                stop('invalid state')
        } else if (!outcome %in% c("heart attack", "heart failure", "pneumonia")){
                stop('invalid outcome')
        } else if (is.numeric(rank)) {
                si <- which(fd[, "state"] == state)
                ## extracting dataframe for the called state
                ts <- fd[si, ]                     
                ts[, eval(outcome)] <- as.numeric(ts[, eval(outcome)])
                ts <- ts[order(ts[, eval(outcome)], ts[, "hospital"]), ]
                output <- ts[, "hospital"][rank]
        } else if (!is.numeric(rank)){
                if (rank == "best") {
                        output <- best(state, outcome)
                } else if (rank == "worst") {
                        si <- which(fd[, "state"] == state)
                        ts <- fd[si, ]    
                        ts[, eval(outcome)] <- as.numeric(ts[, eval(outcome)])
                        ts <- ts[order(ts[, eval(outcome)], ts[, "hospital"], decreasing = TRUE), ]
                        output <- ts[, "hospital"][1]
                } else {
                        stop('invalid rank')
                }
        }
        return(output)
}

rankhospital("NC", "heart attack", "worst")
rankhospital("WA", "heart attack", 7)
rankhospital("TX", "pneumonia", 10)
rankhospital("NY", "heart attack", 7)

rankall <- function(outcome, num = "best"){
        ## Read outcome data
        data <- read.csv("rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")
        fd   <- as.data.frame(cbind(data[, 2],  # hospital
                                    data[, 7],  # state
                                    data[, 11],  # heart attack
                                    data[, 17],  # heart failure
                                    data[, 23]), # pneumonia
                              stringsAsFactors = FALSE)
        colnames(fd) <- c("hospital", "state", "heart attack", "heart failure", "pneumonia")
        fd[, eval(outcome)] <- as.numeric(fd[, eval(outcome)])
        
        ## Check that state and outcome are valid
        
        if (!outcome %in% c("heart attack", "heart failure", "pneumonia")){
                stop('invalid outcome')
        } else if (is.numeric(num)) {
                by_state <- with(fd, split(fd, state))
                ordered  <- list()
                for (i in seq_along(by_state)){
                        by_state[[i]] <- by_state[[i]][order(by_state[[i]][, eval(outcome)], 
                                                             by_state[[i]][, "hospital"]), ]
                        ordered[[i]]  <- c(by_state[[i]][num, "hospital"], by_state[[i]][, "state"][1])
                }
                result <- do.call(rbind, ordered)
                output <- as.data.frame(result, row.names = result[, 2], stringsAsFactors = FALSE)
                names(output) <- c("hospital", "state")
        } else if (!is.numeric(num)) {
                if (num == "best") {
                        by_state <- with(fd, split(fd, state))
                        ordered  <- list()
                        for (i in seq_along(by_state)){
                                by_state[[i]] <- by_state[[i]][order(by_state[[i]][, eval(outcome)], 
                                                                     by_state[[i]][, "hospital"]), ]
                                ordered[[i]]  <- c(by_state[[i]][1, c("hospital", "state")])
                        }
                        result <- do.call(rbind, ordered)
                        output <- as.data.frame(result, stringsAsFactors = FALSE)
                        rownames(output) <- output[, 2]
                } else if (num == "worst") {
                        by_state <- with(fd, split(fd, state))
                        ordered  <- list()
                        for (i in seq_along(by_state)){
                                by_state[[i]] <- by_state[[i]][order(by_state[[i]][, eval(outcome)], 
                                                                     by_state[[i]][, "hospital"], 
                                                                     decreasing = TRUE), ]
                                ordered[[i]]  <- c(by_state[[i]][1, c("hospital", "state")])
                        }
                        result <- do.call(rbind, ordered)
                        output <- as.data.frame(result, stringsAsFactors = FALSE)
                        rownames(output) <- output[, 2]
                } else {
                        stop('invalid num')
                }
        }
        return(output)
}

r <- rankall("heart attack", 4)
as.character(subset(r, state == "HI")$hospital)

r <- rankall("pneumonia", "worst")
as.character(subset(r, state == "NJ")$hospital)

r <- rankall("heart failure", 10)
as.character(subset(r, state == "NV")$hospital)
