## Factorial Function

# Version 1 ----
Factorial_loop <- function(n){
  # error check
  if(n < 0){
    stop("The input must be positive.")
  }
  if(floor(n) != n){
    stop("The input must be an integer.")
  }
  # special case of n=0
  result <- 1
  if(n == 0){
    return(result)
  }
  # regular case of n>=1
  for(i in 1:n){
    result <- result * i
  }
  return(result)
}

## tests
Factorial_loop(-1)
# Error in Factorial_loop(-1) : The input must be positive.
Factorial_loop(0.5)
# Error in Factorial_loop(0.5) : The input must be an interger.
Factorial_loop(0)
# [1] 1
Factorial_loop(10)
# [1] 3628800


# Version 2 ----
Factorial_reduce <- function(n){
  # error check
  if(n < 0){
    stop("The input must be positive.")
  }
  if(floor(n) != n){
    stop("The input must be an integer.")
  }
  # special case of n=0
  result <- 1
  if(n == 0){
    return(result)
  }
  # regular case of n>=1
  result <- Reduce(function(x,y){x * y}, 1:n)
  return(result)
}

## tests
Factorial_reduce(-1)
# Error in Factorial_reduce(-1) : The input must be positive.
Factorial_reduce(0.5)
# Error in Factorial_reduce(0.5) : The input must be an interger.
Factorial_reduce(0)
# [1] 1
Factorial_reduce(10)
# [1] 3628800


# Version 3 ----
Factorial_func <- function(n){
  # error check
  if(n < 0){
    stop("The input must be positive.")
  }
  if(floor(n) != n){
    stop("The input must be an integer.")
  }
  # special case of n=0 or n=1
  result <- 1
  if(n == 0 | n == 1){
    return(result)
  }
  # regular case of n>=2
  result = n * Factorial_func(n-1)
  return(result)
}

## tests
Factorial_func(-1)
# Error in Factorial_func(-1) : The input must be positive.
Factorial_func(0.5)
# Error in Factorial_func(0.5) : The input must be an interger.
Factorial_func(0)
# [1] 1
Factorial_func(10)
# [1] 3628800


# Version 4 ----
Factorial_tbl <- vector('integer')
Factorial_tbl[1] <- 1
Factorial_mem <- function(n){
  # error check
  if(n < 0){
    stop("The input must be positive.")
  }
  if(floor(n) != n){
    stop("The input must be an integer.")
  }
  # special case of n=0 or n=1
  result <- 1
  if(n == 0 | n == 1){
    return(result)
  }
  # regular case of n>=2
  if(!is.na(Factorial_tbl[n])){
    return(Factorial_tbl[n])
  }
  else{
    Factorial_tbl[n-1] <<- Factorial_mem(n-1)
    return(n * Factorial_tbl[n-1]) 
  }
}

## tests
Factorial_mem(-1)
# Error in Factorial_mem(-1) : The input must be positive.
Factorial_mem(0.5)
# Error in Factorial_mem(0.5) : The input must be an interger.
Factorial_mem(0)
# [1] 1
Factorial_mem(10)
# [1] 3628800


# microbenchmark ----
library(microbenchmark)
library(purrr)
# input 10
microbenchmark(Factorial_loop(10),
               Factorial_reduce(10),
               Factorial_func(10),
               Factorial_mem(10))
# input 1:10
map(1:10, function(x){microbenchmark(Factorial_loop(x),
                                     Factorial_reduce(x),
                                     Factorial_func(x),
                                     Factorial_mem(x))})
