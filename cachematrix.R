#VJ Davey 2016


#creates a special matrix object that can cache its inverse
makeCacheMatrix <- function(x = matrix()){
	m <- NULL
	set <- function(y) {
		x <<- y
		m <<- NULL
	}
	get <- function() x
	setinverse <- function(solve) m <<- solve
	getinverse <- function() m
	list(set=set, get=get, setinverse=setinverse,getinverse=getinverse)

}


#computes the inverse of the special matrix returned by makeCacheMatrix. 
#if inverse already calculated and matrix has not changed, should retrieve inverse from cache
cacheSolve <- function(x,...){
	m <- x$getinverse()
	if(!is.null(m)){
		message("getting cached inverse")
		return(m)
	}
	data <-x$get()
	m<-solve(data,...)
	x$setinverse(m)
	m
}
