I. This project includes:

1. A tidy data set called "tidydata.txt"

2. A link to a Github repo with the R script performing the analysis
https://github.com/funnychan01/Course3-Assignment-Tidy-Data

3. A code book that decribes the variables, the data

II. The data for this project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

III. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

IV. Study Design:

1. Set the working directory where the data set stored

2. Read the required training sets and test sets with the function read.table. The files include X_train.txt, y_train.txt, subject_train.txt, X_test.txt, y_test.txt, subject_test.txt

3. Use the function rbind to combine the data from X_train.txt, y_train.txt, subject_train.txt together

4. Use the function rbind to combine the data from X_test.txt, y_test.txt, subject_test.txt together

5. Merges the training and the test sets to create one data set called "dataset"

6. Rename the "dataset"

7. Extract only the measurements on the mean and standard deviation for each measurement from "dataset"

8. Use descriptive activity names to name the activities in the "dataset"

9. Appropriately labels the "dataset" with descriptive variable names

10.From the data set created, creates a second, independent tidy data set, called "tidy_dataset" with the average of each variable for each activity and each subject

11.Export the tidy data set in txt format by the function write.table

12.The tidy data set can be read using the read.table function

V. Acknowledgement:
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
