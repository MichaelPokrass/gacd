# Week 4 Course Project

This repo contains an analysis script (run_analysis.R) that performs the operations described in the getting and cleaning data course project and a codebook (CODEBOOK.md) that describes the variables and summaries calculated.

The analysis script is designed to work when the user has their working directory set such that they can access the data files in the “UCI HAR Dataset” folder.

In the analysis script, the features, activity labels, and raw test and training data are read into R as data tables.

Next, the script extracts only measurements on mean and standard deviation from the X_test and X_train data using the grep command and the extracted measurements are stored as separate variables “subxtest” and “subxtrain”.

The test and training data tables are each combined into a single data table containing all the desired data, and then these tables are finally combined into a single table as a single data set defined as “alldata”.

In the merged dataset, descriptive activity names are assigned to the data using the “activitylabels” data table that was read from the raw data.

The data set then is assigned descriptive variable names from the “features” variable.

Finally, the data is summarized into a single tidy dataset using the group _by and summarize_all commands to include the average of each variable for each activity and each subject.
