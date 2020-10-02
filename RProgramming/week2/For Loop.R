# For 

for(i in 1:10){
  print(i)
}

# Different ways to use for loop

x <- c('a','b','c','d')

for(i in 1:4){
  print(x[i])
}

for(i in seq_along(x)){
  print(x[i])
}

for(letter in x){
  print(letter)
}

for(i in 1:4) print(x[i])

# for loop can be nested
x <- matrix(1:6, 2,3)

for (i in seq_len(nrow(x))) {
  for(j in seq_len(ncol(x))){
    print(x[i,j])
  }
}
