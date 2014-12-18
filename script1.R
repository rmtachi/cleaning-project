## December 18, 2014
## getting and cleaning data
## course project

setwd("~/R/coursera/data-cleaning/project")

## load zip file
zip.name <- "data/human-activity.zip"

if(!file.exists(zip.name)) {
	url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
	download.file(url, destfile=zip.name, mode="wb")
} else{
	print(paste(zip.name," already exists"))
}

## unzip files
unzip(zip.name, setTimes=TRUE)


