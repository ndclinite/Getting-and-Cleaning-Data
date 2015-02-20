#run_analysis.R

**Type:** Function
**Parameters:** None
**Returns:** Data Frame

##Description
This code looks for Samsung data inside the folder UCI HAR Dataset/ .  It will read in two data sets, test and train, add columns for subject and activity, and combine them into one long data set.  It will then aggregate the mean of each measurement, grouped by subject and activity, and return the result as a finished data frame.
