## Create a special "matrix", which is a list containing
## a function to
##   - set the value of the matrix
##   - get the value of the matrix
##   - set the value of the inverse matrix
##   - get the value of the inverse matrix
makeCacheMatrix <- function(a = matrix()) {
    i <- NULL
    set <- function(b) {
        a <<- b
        i <<- NULL
    }
    get <- function() a
    set_inverse <- function(inv) i <<- inv
    get_inverse <- function() i
    list(
        set = set,
        get = get,
        set_inverse = set_inverse,
        get_inverse = get_inverse
    )
}




## Calculate the inverse of the special "matrix" created with the above
## function, reusing cached result if it is available

cacheSolve <- function(a, ...) {
    i <- x$get_inverse()
    if(!is.null(i)) {
        message("getting cached data")
        return(i)
    }
    m <- a$get()
    i <- solve(m, ...)
    x$set_inverse(i)
    i
}
