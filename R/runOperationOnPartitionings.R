#' Runs operations on partitionings
#'
#' allows to specify an operation that will be evaluated, employing two partitioning arguments that will be converted from lists of observations. In openCPU there are currently issues with the lexical scope of eval(), therefore we employ this less dynamic workaround...
#' @param op the name of the operation
#' @param p1 the first list of observations
#' @param n1 the number of partitions for p1
#' @param p2 the second list of observations
#' @param n2 the number of partitions for p2
#' @param expr the expression to be evaluated
runOperationOnPartitionings <- function(op=Null,p1=NULL,n1=-1,p2=NULL,n2=-1,options=NULL) {
	arg1 <- cluster::pam(p1,n1)
	arg2 <- cluster::pam(p2,n2)

	opstr <- as.character(op)

	if (opstr == as.character("clue:cl_dissimilarity")) {
        result <- clue:cl_dissimilarity(arg1,arg2,ifelse(options != null,options[[1]],NULL))
	}
	else {
        return(FALSE)
	}

    return(TRUE)
}