#library reshape
library(reshape)

#Save&unzip file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip on C:\TEST\Date
setwd("C:\\TEST\\Date")

#----------------------------------------------------------------
#1. Merge the training and the test sets to create one data set

#save featur for X train/test
feature = read.table("features.txt", sep="")
XNames = feature$V2

#training set
SubjectTrain = read.table("train\\subject_train.txt", sep="")
names(SubjectTrain)="Subject"
Xtrain = read.table("train\\X_train.txt", sep="")
names(Xtrain) = XNames
Ytrain = read.table("train\\y_train.txt", sep="")
names(Ytrain) = "Activity"
train = cbind(SubjectTrain, Ytrain, Xtrain)

#test set
SubjectTest = read.table("test\\subject_test.txt", sep="")
names(SubjectTest)="Subject"
Xtest = read.table("test\\X_test.txt", sep="")
names(Xtest) = XNames
Ytest = read.table("test\\y_test.txt", sep="")
names(Ytest) = "Activity"
test = cbind(SubjectTest, Ytest, Xtest)

Mdata <- rbind(train, test)


#----------------------------------------------------------------
#2. Extracts only the measurements on the mean and standard deviation for each measurement

# from the measurement names (XNames)
toMatch = c("mean()","std()","Activity", "Subject")
M = unique(grep(paste(toMatch,collapse="|"),names(Mdata), value=TRUE))

Mdata_filter = Mdata[,M] 

#----------------------------------------------------------------
#3. Uses descriptive activity names to name the activities in the data set
#activities are in activity_labels.txt

activ = read.table("activity_labels.txt", col.names=c("ID","Name"))
for(i in 1:nrow(activ)){
	Mdata_filter$Activity[Mdata_filter$Activity==activ[i,"ID"]] = as.character(activ[i,"Name"])
}

#----------------------------------------------------------------
#4.Appropriately labels the data set with descriptive variable names
NewLabels = names(Mdata_filter)
NewLabels = gsub("Acc", "-acceleration", NewLabels)
NewLabels = gsub("std()", "Standard Deviation", NewLabels)
NewLabels = gsub("BodyBody", "Body", NewLabels)

names(Mdata_filter) = NewLabels

#----------------------------------------------------------------
#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
#reshape the data - make variable Subject and Activity
Mdata_filter = melt(Mdata_filter, id=c("Subject","Activity"))
Final_data = cast(Mdata_filter, Subject ~ Activity ,mean)

write.table(Final_data, file="tidyData.txt", row.name=FALSE)
