#' A converter function for partitionings
#'
#' creates a partitioning from a list of values
#' @param list the list of values to be partitioned
#' @param num the number of partitions to create
partitioning <- function(list=NULL,num=-1) {
	p <- cluster::pam(list,num)
	return(TRUE)
}