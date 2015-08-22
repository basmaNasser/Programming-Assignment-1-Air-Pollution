
## makeCacheMatrix <- This function creates a special "matrix" object then calculate it's inverse

makeCacheMatrix <- function(x = matrix()) {
        
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        
        setinv <- function(solve) inv <<- solve
        getinv <- function() inv
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
       
        
}

## cacheSolve <- this function computes the inverse of the special "matrix" returned by makeCacheMatrix above.
## If the inverse has already been calculated, then the cachesolve should retrieve the inverse from the cache.and return message "getting cached data"


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        
       inv <- x$getinv()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        data <- x$get()
        inv <- solve(data, ...)
        x$setinv(inv)
        
}

##test <- matrix(runif(9,1,100),3,3)
##testCached <- makeCacheMatrix(test)
##testInv <- cacheSolve(testCached)

## or

## x = rbind(c(1, -1/4), c(-1/4, 1))
## m = makeCacheMatrix(x)
## m$get()
## cacheSolve(m)
## cacheSolve(m)
##  getting cached data
