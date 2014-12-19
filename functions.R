## December 18, 2014
## getting and cleaning data
## project

## print in more useful units
my.size <- function(x) {
	print(object.size(x), units="Mb")
}

## load X data
## irregular delimiters caused problems in fread
## faster than read.table
readXdata <- function(file.name) {
	strings <- readLines(file.name)
	data <- strsplit(strings, split=" ")
	## remove empty strings
	data <- sapply(data, function(x) as.numeric(x[!(x=="")]))
	as.data.frame(t(data))
}