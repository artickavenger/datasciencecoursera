# While Loop
count <- 0

while(count < 10){
  print(count)
  count <- count + 1
}

# Other sample
x <- 2
z <- 1

while (x >= 3 && x <= 10) {
  print(x)
  coin <- rbinom(1, 1, 0.5)
  
  if(coin == 1){ ## random walk
    z <- z + 1
  } else {
    z <- z - 1
  }
}
