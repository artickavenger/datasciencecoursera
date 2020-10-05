# Repeat
x0 <- 1
tol <- 1e-8

repeat{
  x1 <- computeEstimate()
  
  if(abs(x1 - x0 < to1) {
    break
  } else {
    x0 <- x1
  }
}

# Next

for(i in 1:100){
  if(i <= 20){
    ## Skip the first 20 iterations 
    next
  }
  ## Do something here
}
