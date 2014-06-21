This file is directly derived from the features_info.txt file in the
UCI HAR Dataset (see README.md). The names in the tidy dataset were
derived from those in the original dataset by expanding all
abbreviations to full words and removing non-letters.

Study design
============
Here is the assignment which let to this tidy dataset.

You should create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

Code book
=========
The features selected for this database come from the accelerometer
and gyroscope 3-axial raw signals timeacceleration-xyz and
timegyroscope-xyz. These time domain signals were captured at a
constant rate of 50 Hz. Then they were filtered using a median filter
and a 3rd order low pass Butterworth filter with a corner frequency of
20 Hz to remove noise. Similarly, the acceleration signal was then
separated into body and gravity acceleration signals
(timebodyacceleration-xyz and timegravityacceleration-xyz) using
another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were
derived in time to obtain Jerk signals (timebodyaccelerationjerk-xyz
and timebodygyroscopejerk-xyz). Also the magnitude of these
three-dimensional signals were calculated using the Euclidean norm
(timebodyaccelerationmagnitude, timeGravityAccelerationmagnitude,
timebodyaccelerationjerkmagnitude, timebodygyroscopemagnitude,
timebodygyroscopejerkmagnitude).

Finally a Fast Fourier Transform (FFT) was applied to some of these
signals producing frequencybodyacceleration-xyz,
frequencybodyaccelerationjerk-xyz, frequencybodygyroscope-xyz,
frequencybodyaccelerationjerkmagnitude,
frequencybodygyroscopemagnitude, frequencybodygyroscopejerkmagnitude.

These signals were used to estimate variables of the feature vector
for each pattern:

'xyz' is used to denote 3-axial signals in the X, Y and Z directions.

timebodyaccelerationxyz
timegravityaccelerationxyz
timebodyaccelerationjerkxyz
timebodygyroscopexyz
timebodygyroscopejerkxyz
timebodyaccelerationmagnitude
timegravityaccelerationmagnitude
timebodyaccelerationjerkmagnitude
timebodygyroscopemagnitude
timebodygyroscopejerkmagnitude
frequencybodyaccelerationxyz
frequencybodyaccelerationjerkxyz
frequencybodygyroscopexyz
frequencybodyaccelerationmagnitude
frequencybodyaccelerationjerkmagnitude
frequencybodygyroscopemagnitude
frequencybodygyroscopejerkmagnitude

The set of variables that were estimated from these signals are: 

mean: Mean value
std: Standard deviation

I have selected only those columns which had mean() or std() at the
end of the name. Columns which merely contained "Mean" are omitted.
