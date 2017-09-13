# Set the working directory where the data set stored
setwd("D:/Jackie/Documents/Coursera/Course 3/Week 4")

# Read the required training set and test set
# Merges the training and the test sets to create one data set called dataset
train <- read.table("UCI HAR Dataset/train/X_train.txt")
trainlabel <- read.table("UCI HAR Dataset/train/y_train.txt")
trainid <- read.table("UCI HAR Dataset/train/subject_train.txt")
test <- read.table("UCI HAR Dataset/test/X_test.txt")
testlabel <- read.table("UCI HAR Dataset/test/y_test.txt")
testid <- read.table("UCI HAR Dataset/test/subject_test.txt")
train <- cbind(trainid, trainlabel, train)
test <- cbind(testid, testlabel, test)
dataset <- rbind(train, test)

# Rename the data set
var_name <- read.table("UCI HAR Dataset/features.txt")
var_name <- var_name[, 2]
var_name <- as.character(var_name)
var_name <- c("subjects", "activities", var_name)
names(dataset) <- var_name

# Extract only the measurements on the mean and standard deviation 
# for each measurement
var_mean <- grep("mean\\(\\)", var_name, value = TRUE)
var_std <- grep("std", var_name, value = TRUE)
dataset <- dataset[, c("subjects", "activities", var_mean, var_std)]

# Use descriptive activity names to name the activities in the data set
label <- read.table("UCI HAR Dataset/activity_labels.txt")
for (i in 1:length(dataset[, 2])) {
                if (dataset[, 2][i] == label[1,1]) {
                        dataset[, 2][i] <- "walking"
                } else if (dataset[, 2][i] == label[2,1]) {
                        dataset[, 2][i] <- "walking_upstairs"
                } else if (dataset[, 2][i] == label[3,1]) {
                        dataset[, 2][i] <- "walking_downstairs"
                } else if (dataset[, 2][i] == label[4,1]) {
                        dataset[, 2][i] <- "sitting"
                } else if (dataset[, 2][i] == label[5,1]) {
                        dataset[, 2][i] <- "standing"
                } else if (dataset[, 2][i] == label[6,1]) {
                        dataset[, 2][i] <- "laying"
                } 
}

# Appropriately labels the data set with descriptive variable names
data_name <- names(dataset)
data_name <- gsub("^t", "time", data_name)
data_name <- gsub("^f", "freq", data_name)
data_name <- gsub("mean", "Mean", data_name)
data_name <- gsub("std", "Std", data_name)
data_name <- gsub("-", "", data_name)
data_name <- gsub("\\(\\)", "", data_name)
colnames(dataset) <- data_name

# From the data set created, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject
library(dplyr)
tidy_dataset <- dataset %>% 
        group_by(subjects, activities) %>% 
        summarize_all(mean)
# Export the tidy data set in csv format
write.table(tidy_dataset, "tidydata.txt", row.names = FALSE)
