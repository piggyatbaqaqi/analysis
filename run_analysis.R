# You should create one R script called run_analysis.R that does the following.
activity.labels <- read.table("UCI HAR Dataset/activity_labels.txt",
                              header=FALSE,
			      col.names=c("activity.code", "activity"))
features <- read.table("UCI HAR Dataset/features.txt",
                       header=FALSE,
		        col.names=c("featurecode", "feature"))

train.subject <- read.table("UCI HAR Dataset/train/subject_train.txt",
                            header=FALSE, col.names=c("subject"))
train.y       <- read.table("UCI HAR Dataset/train/y_train.txt",
                            header=FALSE, col.names=c("activity.code"))
train.X       <- read.table("UCI HAR Dataset/train/X_train.txt",
                            header=FALSE, col.names=features$feature)

test.subject  <- read.table("UCI HAR Dataset/test/subject_test.txt",
                            header=FALSE, col.names=c("subject"))
test.y        <- read.table("UCI HAR Dataset/test/y_test.txt",
                            header=FALSE, col.names=c("activity.code"))
test.X        <- read.table("UCI HAR Dataset/test/X_test.txt",
                            header=FALSE, col.names=features$feature)

# Merge the training and the test sets to create one data set.
ucihar <- rbind(train.X, test.X)
ucihar$subject <- rbind(train.subject, test.subject)
ucihar$activity <- rbind(train.y, test.y)

# Extract only the measurements on the mean and standard deviation for each measurement. 

# Use descriptive activity names to name the activities in the data set

# Appropriately label the data set with descriptive variable names. 

# Create a second, independent tidy data set with the average of each variable for
# each activity and each subject. 
