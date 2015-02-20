run_analysis <- function()
{	library(dplyr)
  	library(tidyr)
	
  ##setup column header
	cols <- read.table("UCI HAR Dataset/features.txt")
  	cols <- rbind(cols, cbind(NA,"activity_code"), cbind(NA, "subject"), cbind(NA,"source"))
	
  ##get test data sets
	x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
  	y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
  	subj_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
  ##add activity_code, subject_code, and source columns
  	test_data <- cbind(x_test, y_test, subj_test, rep("test", nrow(x_test)))
  	rm(x_test)
  	rm(y_test)
  	rm(subj_test)
  ##apply column header
  	colnames(test_data) <- cols[,2]
  
  ##get train data sets
  	x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
  	y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
  	subj_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
  ##add activity_code, subject, and source columns
  	train_data <- cbind(x_train, y_train, subj_train, rep("train", nrow(x_train)))
  	rm(x_train)
  	rm(y_train)
  	rm(subj_train)
  ##apply column header
  	colnames(train_data) <- cols[,2]
  
  ##combine test and train data sets
  	data_source <- rbind(test_data, train_data)
  	rm(test_data)
  	rm(train_data)
  	
  ##strip out all non-mean, non-std variables
  	data_set <- data_source[,grepl("mean\\(\\)|std\\(\\)|activity_code|subject|source", colnames(data_source))]
  
  ##get activity labels
  	activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
  	colnames(activity_labels) <- cbind("activity_code", "activity")
  ##merge activity labels into data_set
  	data_set <- merge(data_set, activity_labels, by="activity_code")
  
  ##get wide-form data
  	result <- select(data_set, -activity_code, -source) %>%
  		group_by( subject, activity ) %>%
  		summarise_each(funs(mean))
  
  ##get long-form data
#   ##uniquely identify each observation prior to data manipulations
#   	data_set$observation <- 1:nrow(data_set)
#   
#   	result <- data_set %>%
#   		gather( measurement, value, -observation, -activity_code, -subject, -source, -activity) %>%
#   		separate( col = measurement, into = c("signal", "measure_type", "axis"), sep = "-", extra = "merge") %>%
#   		mutate( measure_type = gsub("\\(|\\)", "", measure_type) ) %>%
#   		spread( key = measure_type, value = value) %>%
#   		group_by( subject, activity, signal, axis) %>%
#   		summarize( avg_mean = mean(mean), avg_std = mean(std)) %>%
#   		ungroup %>%
#   		arrange( subject, activity, signal, axis)0
}