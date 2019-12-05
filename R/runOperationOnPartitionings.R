runOperationOnPartitionings <- function(op=Null,p1=NULL,n1=-1,p2=NULL,n2=-1,options=NULL) {
	arg1 <- cluster::pam(p1,n1)
	arg2 <- cluster::pam(p2,n2)

	if (op == "dissimilarity") {
        result <- clue:cl_dissimilarity(arg1,arg2,ifelse(options != null,options[[1]],NULL))
	}
	else {
        return(FALSE)
	}

    return(TRUE)
}