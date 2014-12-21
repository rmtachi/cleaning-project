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

## not related to preparing data
## counts number of windows in each time series
## specifically for subject and activity vectors - v2 changes faster than v1
timeSeries <- function(v1, v2) {
	out <- numeric(3)
	count <- 1
	index <- 1
	current <- v2[index]
	while(index <= length(v1)) {
		while(index < length(v1) && current == v2[index+1]) {
			count <- count+1
			index <- index+1
		}
		out <- rbind(out,c(v1[index],v2[index],count))
		count <- 1
		index <- index+1
		current <- v2[index]
	}
	out[-1,]
}