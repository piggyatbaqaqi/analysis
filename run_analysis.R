# You should create one R script called run_analysis.R that does the following.

# Get the descriptive activity names.
activity.labels <- read.table("UCI HAR Dataset/activity_labels.txt",
                              header=FALSE,
			      col.names=c("activity.code", "activity"))
# Get the names of columns.
features <- read.table("UCI HAR Dataset/features.txt",
                       header=FALSE,
		        col.names=c("featurecode", "feature"))

# Load the training set.
train.subject <- read.table("UCI HAR Dataset/train/subject_train.txt",
                            header=FALSE, col.names=c("subject"))
train.y       <- read.table("UCI HAR Dataset/train/y_train.txt",
                            header=FALSE, col.names=c("activity.code"))
train.X       <- read.table("UCI HAR Dataset/train/X_train.txt",
                            header=FALSE, col.names=features$feature)
# Load the test set.
test.subject  <- read.table("UCI HAR Dataset/test/subject_test.txt",
                            header=FALSE, col.names=c("subject"))
test.y        <- read.table("UCI HAR Dataset/test/y_test.txt",
                            header=FALSE, col.names=c("activity.code"))
test.X        <- read.table("UCI HAR Dataset/test/X_test.txt",
                            header=FALSE, col.names=features$feature)

# Merge the training and the test sets to create one data set.
ucihar.raw <- rbind(train.X, test.X)

# Extract only the measurements on the mean and standard deviation
# for each measurement. 
columns <- grep("[a-zA-Z]+\\.(std|mean)\\.", names(ucihar.raw))
ucihar.subset <- ucihar.raw[, columns]

# Pick up the experimental subjects.
ucihar.subset$subject <- rbind(train.subject, test.subject)$subject

# Use descriptive activity names to name the activities in the data set.
ucihar.subset$activity.code <- rbind(train.y, test.y)$activity.code
ucihar <- merge(activity.labels, ucihar.subset, by="activity.code", all=TRUE)
ucihar$activity.code <- NULL

# Appropriately label the data set with descriptive variable names. 
new.names <- names(ucihar)
new.names <- gsub("^t", "time", new.names)
new.names <- gsub("^f", "frequency", new.names)
new.names <- gsub("Acc", "Acceleration", new.names)
new.names <- gsub("Gyro", "Gyroscope", new.names)
new.names <- gsub("Mag", "Magnitude", new.names)
new.names <- gsub("\\.\\.", "", new.names)
names(ucihar) <- new.names

# Create a second, independent tidy data set with the average of each
# variable for each activity and each subject.
subject <- ucihar$subject
activity <- ucihar$activity
ucihar$subject <- NULL
ucihar$activity <- NULL
tidy <- aggregate(ucihar,
                  by=list(subject=subject, activity=activity),
                  mean)
new.names <- paste0("Mean.", names(tidy))
new.names <- gsub("Mean\\.subject", "subject", new.names)
new.names <- gsub("Mean\\.activity", "activity", new.names)
names(tidy) <- new.names

write.table(tidy, file="UCI_HAR_tidy.txt", row.names=FALSE)
