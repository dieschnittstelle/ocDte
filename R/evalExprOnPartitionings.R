#' Applies dynamic evaluation on two partitionings
#'
#' allows to pass an expression that will be evaluated, employing two partitioning arguments that will be converted from lists of observations
#' @param p1 the first list of observations
#' @param n1 the number of partitions for p1
#' @param p2 the second list of observations
#' @param n2 the number of partitions for p2
#' @param expr the expression to be evaluated
evalExprOnPartitionings <- function(p1=NULL,n1=-1,p2=NULL,n2=-1,expr) {
    library(rlang)
    library(purrr)

	part1 <- cluster::pam(p1,n1)
	part2 <- cluster::pam(p2,n2)

	result <- eval(parse(text=expr))

    return(TRUE)
}