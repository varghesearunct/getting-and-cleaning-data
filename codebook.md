##Steps for sucessful execution of code

Download the zip file from this link- https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and extract it to your current working directory of R. The code also requires "dplyr" package to installed in R. Load the R script into R and you will get the results.

## R Script

The R script run_analysis.R does the following 5 operations:-
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each      subject.

##About Variables:

act_lab- contains the datasets activity names
features- contains the correct name for the train and test dataset
x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files.
new_data contains the merged dataset
fin_data contains the final dataset after performing the second operation
ind_set contains the dataset as required in the 5th objective.


