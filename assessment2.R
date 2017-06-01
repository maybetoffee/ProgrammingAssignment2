## makeCacheMatrix is a function that returns a list of functions
## Its puspose is to store a martix and a cached value of the inverse of the 
## matrix. Contains the following functions:
## * setMatrix      set the value of a matrix
## * getMatrix      get the value of a matrix
## * cacheInverse   get the cahced value (inverse of the matrix)
## * getInverse     get the cahced value (inverse of the matrix)
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


## The following function calculates the inverse of a "special" matrix created with 
## makeCacheMatrix
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
