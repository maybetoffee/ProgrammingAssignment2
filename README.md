#assessment 2


makeCacheMatrix is a function that returns a list of functions
Its puspose is to store a martix and a cached value of the inverse of the 
matrix. Contains the following functions:
setMat      set the value of a matrix
getMat      get the value of a matrix
cacheInv   get the cahced value (inverse of the matrix)
getInv     get the cahced value (inverse of the matrix)
<!-- -->
makeCacheMatrix <- function(x = matrix()) {
  cache <- NULL
  
  setMat <- function(matrix) {
    x <<- matrix
    cache <<- NULL
  }
  
  getMat <- function() {
    x
  }
  
  cacheInv <- function(solve) {
    cache <<- solve
  }
  

  getInv <- function() {
    cache
  }
  
  list(setMat = setMat, getMat = getMat, cacheInv = cacheInv, getInv = getInv)
}


The following function calculates the inverse of the special "matrix"
created with the above function. However, it first checks to see if the
inverse has already been calculated. If so, it get the mean from the
cache with `getmat` and skips the computation. Otherwise, it calculates the inverse of
the data and sets the value of the mean in the cache via the `setinv`
function.
 # The following function calculates the inverse of a "special" matrix created with 
    # makeCacheMatrix
cacheSolve <- function(y, ...) {

  inverse <- y$getInv()
  # if a cached value exists return it
  if(!is.null(inverse)) {
    message("getting cached data")
    return(inverse)
  }
  # otherwise get the matrix, caclulate the inverse and store it in
  # the cache
  data <- y$getMat()
  inverse <- solve(data)
  y$cacheInv(inverse)
  
  # return the inverse
  inverse
}
   

And then we are going to demonstrate how to run these codes:
the first thing to do is set the directory, I saved the file in D:\coursera_R and named it makecachematrix.R, when you clone the #directory, don't forget to change D:\ into D:/;
> source("D:/coursera_R/makecachematrix.R")
and initialize the matrix:
 a <- makeCacheMatrix( matrix(c(1,2,3,4), nrow = 2, ncol = 2) );

> summary(a)
       Length Class  Mode    
#setmat 1      -none- function
#getmat 1      -none- function
#setinv 1      -none- function
#getinv 1      -none- function

> a$getMat()
     [,1] [,2]
[1,]    1    3
[2,]    2    4

> cacheSolve(a)
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5

