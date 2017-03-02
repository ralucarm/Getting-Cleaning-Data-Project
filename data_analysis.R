getwd()
setwd("D:/DataScience/DataCleaning/project")
library(plyr)
##Get the data set
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")
unzip(zipfile="./data/Dataset.zip",exdir="./data")

##Merges the training and the test sets to create one data set
x_test <- read.table("./data/UCI HAR Dataset/test/x_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

x_train <- read.table("./data/UCI HAR Dataset/train/x_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

activity_labels = read.table('./data/UCI HAR Dataset/activity_labels.txt')
features <- read.table('./data/UCI HAR Dataset/features.txt')

summary(subject_test)
summary(subject_train)
summary(x_test)
summary(x_train)
summary(y_test)
summary(y_train)

x_ds <- rbind(x_train, x_test)
y_ds <- rbind(y_train, y_test)
subject_ds <- rbind(subject_train, subject_test)
summary(subject_ds)


##Extracts only the measurements on the mean and standard deviation for each measurement
mean_std_features <- grep("-(mean|std)\\(\\)", features[, 2])
x_ds <- x_ds[, mean_std_features]
summary(x_ds)
names(x_ds) <- features[mean_std_features, 2]

##Uses descriptive activity names to name the activities in the data set
y_ds[, 1] <- activity_labels[y_ds[, 1], 2]
names(y_ds) <- "activity_ds"
summary(y_ds)

##Appropriately labels the data set with descriptive variable names
names(subject_ds) <- "subject_ds"
total_ds <- cbind(x_ds, y_ds, subject_ds)
summary(total_ds)

##Create a second, independent tidy data set with the average of each variable for each activity and each subject
tidy_ds <- ddply(total_ds, .(subject_ds, activity_ds), function(x) colMeans(x[, 1:66]))
write.table(tidy_ds, "tidy_ds.txt", row.name=FALSE)


