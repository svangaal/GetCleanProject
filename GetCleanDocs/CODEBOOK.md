===============================================================
Course submission for "Getting and Cleaning Data" on Coursera
Prepared by Stephen van Gaal on May 24 2016
===============================================================
Codebook for dataframe "aggmeans"

subject: factor, unique identifier for each subject in the raw data

activity: factor, description of activity with levels walking, walking upstairs, walking downstairs, sitting, standing, and laying.

The remaining columns indicate the mean value between all observations of
each subject * activity pair. Mean of means and mean of standard deviations
are reported. Measured variables include:

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

For detail on the derivation of the raw data, please refer to the features.txt
file from the original dataset.