## The Data Source

The data linked to this project represents data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description 
is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data used for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## The Analysis
In the script data_analysis.R, the following steps are applied on the data set (specified above):
* The "train" and the "test" data sets are merged to create one data set -> the rbind() function is used
* Extracts only the measurements on the mean and standard deviation for each measurement -> from the "features" dataset and also, 
they are given the names associated with that dataset
* Uses descriptive activity names to name the activities in the data set -> the activity names and the id's are taken from the "activities" 
dataset
* Appropriately labels the data set with descriptive variable names
* Create a second, independent tidy data set with the average of each variable for each activity and each subject -> the tidy set is written 
to a file: "tidy_ds.txt", and can be found in this repo

## Tha Variables used
* *x_test, y_test, subject_test, x_train, y_train, subject_train, activity_labels, features* -> are the variables used to store the datasets 
downloaded from the archive mentioned above
* *subject_ds* -> the name of the merged dataset (with the "train" and "test" datasets)
* *mean_std_features* -> the name of the dataset contianing only the measurements on the mean and standard deviation for each measurement
* *tidy_ds* -> is the tidy dataset, that was also written on the text file "tidy_ds.txt" that can be found in this repo
