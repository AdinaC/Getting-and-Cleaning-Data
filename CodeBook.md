What is it?

This CodeBook describes the data contained in the output of the run_analysis.R script contained in this repository. The tidy data can be read using data.table to create a data table for further analysis.

tidy_data <- data.table("tidyData.txt")

The script creates a tidy dataset for Human Activity Recognition (HAR) using smartphones that can be used for further research and analysis. The original UCI HAR Dataset is explained here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Description of the UCI HAR variables

The Tidy dataset consists of 10299 observations summarized by activity (6 categories – walking, walking_upstairs, walking_downstais, sitting, standing and laying) and subject (30 subjects). 

Subject

A unique identifier (1-30) of the volunteer.

Activity

The activity name with the following possible values.

•	WALKING

•	WALKING_UPSTAIRS

•	WALKING_DOWNSTAIRS

•	SITTING

•	STANDING

•	LAYING
