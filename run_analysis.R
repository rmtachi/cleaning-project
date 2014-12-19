## December 18, 2014
## getting and cleaning data
## course project

## main script for loading, cleaning data

## set this to working directory, everything else should run unmodified
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
if(!file.exists("UCI HAR Dataset")) {
	unzip(zip.name, setTimes=TRUE)
} else {
	print(paste(zip.name, " already unzipped"))
}

## load all data
source("functions.R")

test.x <- readXdata("UCI HAR Dataset/test/X_test.txt")
train.x <- readXdata("UCI HAR Dataset/train/X_train.txt")

test.y <- as.numeric(readLines("UCI HAR Dataset/test/y_test.txt"))
train.y <- as.numeric(readLines("UCI HAR Dataset/train/y_train.txt"))

test.subject <- as.numeric(readLines("UCI HAR Dataset/test/subject_test.txt"))
train.subject <- as.numeric(readLines("UCI HAR Dataset/train/subject_train.txt"))

features <- read.table("UCI HAR Dataset//features.txt",
					   colClasses=c("numeric","character"))

acts <- read.table("UCI HAR Dataset//activity_labels.txt",
				    col.names=c("val","lab"),
					colClasses=c("numeric", "character"))

######## merge and extract ##########

test.s <- nrow(test.x)
train.s <- nrow(train.x)

## only mean and std for each variable
main.feat <- grep("mean\\(\\)|std\\(\\)", x=features[,2])

## clean feature names
## remove (), change "-" to ".", delete duplicate "Body"
f.names <- sub("\\(\\)", "", features[main.feat,2])
f.names <- gsub("\\-", ".", f.names)
f.names <- sub("BodyBody", "Body", f.names)

## rename activity labels
## (not necessary - could code directly)
acts$lab <- c("walk","up","down","sit","stand","lay")

## reduce and merge feature variables
har.data <- rbind(train.x[,main.feat], test.x[,main.feat])
names(har.data) <- f.names

## merge
har.data <- cbind(subject = factor(c(train.subject, test.subject)),
				  activity = factor(c(train.y, test.y), acts$val, acts$lab),			  
				  har.data,
				  set = c(rep(1, train.s), rep(2, test.s) )
				  )


## order by subject and activity
require(plyr)
har.data <- arrange(har.data, subject, activity)

## remove part data
rm(train.x, train.y, test.x, test.y, test.subject, 
   train.subject, features, f.names, acts, main.feat, test.s, train.s)


########## create summary data #############
## aggregate: for each column in df compute FUN over groups defined by "by"
## 1st factor is rows, 2nd factor columns, etc. Since R iterates over rows first
## last factor changes the least
har.summ <- aggregate(har.data[,-(1:2)], 
					  by=list(subject=har.data$subject, activity=har.data$activity),
					  FUN=mean)

## write
write.table(har.summ, file="HAR_summary.txt", row.names = FALSE)
