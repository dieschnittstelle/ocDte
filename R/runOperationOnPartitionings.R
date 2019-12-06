#' Runs operations on partitionings
#'
#' allows to specify an operation that will be evaluated, employing two partitioning arguments that will be converted from lists of observations. In openCPU there are currently issues with the lexical scope of eval(), therefore we employ this less dynamic workaround... it finally turns out that this workaround is obsolete: strings must be quoted when passed to openCPU, i.e. we can use the more generic implementation.
#' @param op the name of the operation
#' @param p1 the first list of observations
#' @param n1 the number of partitions for p1
#' @param p2 the second list of observations
#' @param n2 the number of partitions for p2
#' @param expr the expression to be evaluated
runOperationOnPartitionings <- function(op=NULL,p1=NULL,n1=-1,p2=NULL,n2=-1,options=NULL) {
	arg1 <- cluster::pam(p1,n1)
	arg2 <- cluster::pam(p2,n2)

	print(op)

	opstr <- as.character(op)

	print(opstr)

	if (opstr == as.character("clue::cl_dissimilarity")) {
	    print("run cl_dissimilarity...")
        result <- clue::cl_dissimilarity(arg1,arg2)#,ifelse(options != NULL,options[[1]],"euclidean"))
	    print("run cl_dissimilarity: done")
	}
	else if (opstr == as.character("clue::cl_agreement")) {
	    print("run cl_agreement...")
        result <- clue::cl_agreement(arg1,arg2)#,ifelse(options != NULL,options[[1]],"euclidean"))
	    print("run cl_agreement: done")
	}
	else {
	    print("unknown operation!")
        return(FALSE)
	}

    return(TRUE)
}