## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

##The first function, makeVector creates a special "vector", which is really a list containing a function to

## 1. set the value of the vector
## 2. get the value of the vector
## 3. set the value of the mean
## 4. get the value of the mean

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setInverse <- function(solve) m <<- solve
  getInverse <- function() m
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)  
}


## Write a short comment describing this function
## The following function calculates the inverse of the 
## special "vector" created with the above function. 
## However, it first checks to see if the inverse has 
## already been calculated. If so, it gets the inverse 
## from the cache and skips the computation. Otherwise, 
## it calculates the inverse of the data and sets the 
## value of the inverse in the cache via the setscope function.
cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
  m <- x$getInverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setInverse(m)
  m
}



