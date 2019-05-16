# Getting-and-Cleaning-Data-Week-4

The uploaded script performs 5 tasks which have been labelled.

#1
Merging Test and Train datasets. These two datasets are joined by using rbind. 

#2
Extracting columns that provide mean and std. The column names are available in the text file features. I have extracted the required columns from that file and used a subset of the original file to proceed with the other steps.

#3
Use descriptive activity names. Here I have cleaned the column names.

#4
Activity Column is changed to factor variable and the right name is associated with the given number in the text file activity.

#5
From the data set in step 4, a second, independent tidy data is created set with the average of each variable for each activity and each subject.
