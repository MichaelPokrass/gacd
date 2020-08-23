#code for peer graded assignment
library(dplyr)

#read features and activity labels into tables
features <- read.table("features.txt")
activitylabels <- read.table("activity_labels.txt")

#load test data
xtest <- read.table("test/X_test.txt")
ytest <- read.table("test/Y_test.txt")
subjecttest <- read.table("test/subject_test.txt")

#load training data
xtrain <- read.table("train/X_train.txt")
ytrain <- read.table("train/y_train.txt")
subjecttrain <- read.table("train/subject_train.txt")

#extract measurements on mean and standard deviation from train and test data
subxtest <- xtest[, grep(".*(mean|std)().*",features[,2])] 
subxtrain <- xtrain[, grep(".*(mean|std)().*",features[,2])] 

#combine subject, y, and extracted x data into single single data frame for both test and training data
testdata <- cbind(subjecttest,ytest,subxtest)
traindata <- cbind(subjecttrain,ytrain,subxtrain)

#merge train and test data frames into single data frame
alldata <- rbind(traindata,testdata)

#assigns descriptive activity names to activity data
alldata[,2]=activitylabels[alldata[,2],2] 

#assigns descriptive variable names to data set
colnames(alldata) <- c("subject","activity",features[grep(".*(mean|std)().*",features[,2]),2])

#groups alldata by subject and activity
groupdata <- group_by(alldata, subject,activity)

#summarizes data into tidy data set with the average of each variable for each activity and subject
tidydata <- summarize_all(groupdata,mean)
