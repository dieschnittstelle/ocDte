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

	part1 <- ifelse(n1 == -1,p1,cluster::pam(p1,n1))
	part2 <- ifelse(n2 == -1,p2,cluster::pam(p2,n2))

	result <- eval(parse(text=expr))

    # TODO: we need to somehow pass information on how to process the result - this here is a solution that only works for distance/similarity measurements
    if (retattrs == NULL) {
        return(result[1])
    }
    else {
        retval <- {}
        for (attr in 1:length(retattrs)) {
            retval[attr] <- return[attr]
        }
        return(retval)
    }
}