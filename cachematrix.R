## Function that computes and caches the 

makeCacheMatrix <- function(x = matrix()) {
m <- NULL
set <- function(y) {
        x<<- y
        m <<- NULL
}
        get <- function() x
        setinv <- function(solve) m <<- solve
        getinv <- function () m
        matrix(set = set, get = get,
        setinv = setinv ,
        getinv = getinv)
}


## Function below retrieves an inverse, if needed.

cacheSolve <- function(x, ...) {
     m <- x$getinv()
     if(!is.null(m)) {
             message("please wait, getting data from cache...")
             return (m)
     }
     data<- x$get()
     m <- solv(data, ...)
     x$setinv(m)
     m
}
