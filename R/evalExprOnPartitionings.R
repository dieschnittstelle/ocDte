#' Applies dynamic evaluation on two partitionings
#'
#' allows to pass an expression that will be evaluated, employing two partitioning arguments that will be converted from lists of observations
#' @param p1 the first list of observations
#' @param n1 the number of partitions for p1
#' @param p2 the second list of observations
#' @param n2 the number of partitions for p2
#' @param expr the expression to be evaluated
#' @param retattrs the attributes to return from the result object
evalExprOnPartitionings <- function(p1=NULL,n1=-1,p2=NULL,n2=-1,expr,retattrs=NULL) {
    library(rlang)
    library(purrr)

    print(n1)
    print(n2)
    print(retattrs)
#    for (attr in 1:length(retattrs)) {
#        print(retattrs[attr])
#    }

	part1 <- p1
	part2 <- p2
	if (n1 != -1) {
	    print("creating partitioning from p1...")
    	part1 <- cluster::pam(p1,n1)
	}
	if (n2 != -1) {
	    print("creating partitioning from p2...")
    	part2 <- cluster::pam(p2,n2)
	}

	print("eval...")

	result <- eval(parse(text=expr))

    print("returning result...")
    if (length(retattrs) == 0) {
        print("return first element of result")
        return(result[1])
    }
    else {
        print("return specified attributes from result...")
        retval <- {}
        for (attr in 1:length(retattrs)) {
            retval[retattrs[attr]] <- result[retattrs[attr]]
        }
        return(retval)
    }
}