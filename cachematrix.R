## This pair of fuctions  calculte de inverse of a matrix and cache(save)
## it in R object. The idea behind this functions is to save memory resources
## and when wee need the same inverse matrix we just can retrieve the object
##which cachet instead of recalculet the inverse everytime that we ask for it,

## makeCacheMatrix creates a invairoment whit variables m, 
## and four functions get, set, getInverse, setInverse. 
## We are going tu use this envieroiment to store our inverse matrix

makeCacheMatrix <- function(x = matrix()) {
  
  makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y){
      x <<- y
      inv <<- NULL
    }
    get <- function() x
    setInverse <- function(solveMatrix) inv <<- solveMatrix
    getInverse <- function() inv
    list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
  }
  
}


## cahceSolve is a function which calculet the inverse matrix
## and call the objets of the makeCachematrix to store it. 

cacheSolve <- function(x, ...) {
  
  inv <- x$getInverse()
  if(!is.null(inv)){
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data)
  x$setInverse(inv)
  inv    
  
}
