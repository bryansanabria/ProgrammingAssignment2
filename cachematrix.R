## One function creates a matrix and store its inverse. 
## The other computes the result of the first one

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
        #Set value of special matrix
        m<- NULL
        set <-functon(y){
                x<<-y
                m<<-NULL
        }
        
        #Get the value of special matrix 
        get <- function() x
        
        #Set the value of the inverse
        setinv <-function(solve) m <<- solve
        
        #Get the value of the inverse
        getinv <- function() m
        
        #Returned a list of the function above
        list(set=set,get=get,
             setinv=setinv,
             getinv=getinv)
}

##  This function computes the inverse of the special "matrix" 
## returned by makeCacheMatrix above. 

cacheSolve <- function(x, ...) {
        
        m <- x$getinv()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        
        ## Return a matrix that is the inverse of 'x'
        data <- x$get()
        m <- solve(data, ...)
        x$setinv(m)
        m
        
}
