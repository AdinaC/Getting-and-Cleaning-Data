UCI HAR Dataset Analysis

This repo contains the R scripts that can be used to analysis the UCI HRA Dataset (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and convert it into a tidy data set.

Project requirements

Create one R script called run_analysis.R that does the following:

1.	Merges the training and the test sets to create one data set.

2.	Extracts only the measurements on the mean and standard deviation for each measurement. 

3.	Uses descriptive activity names to name the activities in the data set

4.	Appropriately labels the data set with descriptive variable names. 

5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

R code

The R code that is used for analysis is available in the run_analysis.R file.
Download the zip file (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) on C:/Test and then run the script using the following command:

source("run_analysis.R")

The tidy data set can be loaded back into R using the following command

tidy_data <- read.table("tidy_data.txt")

Data CodeBook

The CodeBook.md describes the variables, the data and transformations or work performed to clean up the data.
