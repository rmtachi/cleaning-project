## December 18, 2014
## getting and cleaning data
## course project

## main script for loading, cleaning data

## set this to working directory, everything else should run unmodified
setwd("~/R/coursera/cleaning/project")

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
f.names <- sub("(\\w+)\\.([XYZ])", "\\2.\\1", f.names)
f.names <- sub("(Mag)", ".\\1", f.names)

## rename activity labels
## (not necessary - could code directly)
acts$lab <- c("walk","up","down","sit","stand","lay")

## reduce and merge feature variables
har.data <- rbind(train.x[,main.feat], test.x[,main.feat])
names(har.data) <- f.names

## merge
har.data <- cbind(subject = factor(c(train.subject, test.subject)),
				  activity = factor(c(train.y, test.y), acts$val, acts$lab),			  
				  set = c(rep(1, train.s), rep(2, test.s) ),
				  har.data				  
				  )


## remove part data
rm(train.x, train.y, test.x, test.y, test.subject, 
   train.subject, features, f.names, acts, main.feat, test.s, train.s)


########## create summary data #############
## aggregate: for each column in df compute FUN over groups defined by "by"
har.summ <- aggregate(har.data[,-(1:2)], 
					  by=list(subject=har.data$subject, activity=har.data$activity),
					  FUN=mean)


## order by subject then activity
require(plyr)
har.summ <- arrange(har.summ, subject, activity)

## write
write.table(har.summ, file="data/HAR_summary.txt", row.names = FALSE)
write.table(har.data, file="data/HAR_mean_sd.txt", row.names = FALSE)
