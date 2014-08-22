## Put comments here that give an overall description of what your
## functions do
## This file contains two functions makeCacheMatrix and cacheSolve
## makeCacheMatrix creates functions to create the matrix, store and retrieve the inverse
## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
	prevCache <- NULL
## return the matrix
        get <- function() x
## set the inverse in the cache
        setcache <- function(cache) prevCache <<- cache
## return the inverse in the cache
        getcache <- function() prevCache
        list( get = get,
             setcache = setcache,
             getcache = getcache)
}


## Write a short comment describing this function
## Return a matrix that is the inverse of 'x'

cacheSolve <- function(x, ...) {
	m <- x$getcache() ## check if a inverse already exists
        if(!is.null(m)) {
               	 message("getting cached inverse")
               	 return(m)
	}
        data <- x$get() ## get the matrix
        m <- solve(data) ## calculate the inverse
        x$setcache(m) ## preserve it for future use
	return(m)
}
