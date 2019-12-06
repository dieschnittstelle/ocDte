evalExprOnPartitionings <- function(p1=NULL,n1=-1,p2=NULL,n2=-1,expr) {
	part1 <- cluster::pam(p1,n1)
	part2 <- cluster::pam(p2,n2)

	result <- eval(parse(text=expr))

    return(TRUE)
}