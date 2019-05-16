#Reading Data

subject_test = read.table("test/subject_test.txt")
subject_train = read.table("train/subject_train.txt")

X_test = read.table("test/X_test.txt")
X_train = read.table("train/X_train.txt")

y_test = read.table("test/y_test.txt")
y_train = read.table("train/y_train.txt")

activity_labels = read.table("activity_labels.txt")
features = read.table("features.txt")




#1 Merges the training and the test sets to create one data set.
#Test and training data of X are merged together

X_Train_Test = rbind(X_test, X_train)
names(X_Train_Test) = features[ , "V2"]

#2 Extracts only the measurements on the mean and standard deviation for each measurement.
#Colmuns with Mean and STD Only

Mean_Std_Cols <- grep("mean()|std()", features[, 2]) 
X_Train_Test_ms = X_Train_Test[ , Mean_Std_Cols]

#3 Uses descriptive activity names to name the activities in the data set
features[,"V2"] = gsub("[()]", "", features[,"V2"])
names(X_Train_Test_ms) = features[Mean_Std_Cols , "V2"]

#4 Appropriately labels the data set with descriptive variable names.

subject = rbind(subject_test, subject_train)
names(subject) = "subject"
activity = rbind(y_test, y_train)
names(activity) = "activity"
X_Train_Test_ms = cbind(subject, activity, X_Train_Test_ms)

activity_groups = factor(X_Train_Test_ms$activity)
levels(activity_groups) = activity_labels[,2]
X_Train_Test_ms$activity = activity_groups

#5 From the data set in step 4, creates a second, 
#independent tidy data set with the average of each variable for each activity and each subject.

dataset_1 = melt(X_Train_Test_ms, id = c("subject", "activity"))
dataset_2 = dcast(dataset_1, subject+activity~variable, mean)
names(dataset_2)[-c(1,2)] = paste("Mean: ", names(dataset_2)[-c(1,2)])
write.table(dataset_2, "tidy_data.txt", sep = ",")
