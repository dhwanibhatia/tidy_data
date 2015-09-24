
The script reads the Test and Train data and outputs the average of columns (mean/std columns)
per subject and teh activity that the subject performed.
From the original data set which had many other factors for each feature (like correlatiin etc)
were filtered out and only mean and std for the features was analysed.

The averages are computed for the Mean and Standard deviations of following features:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean
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

Features are normalized and bounded within [-1,1] and hence have no units.
Explanation for each feature is not being given as that was specified in the original data set.
