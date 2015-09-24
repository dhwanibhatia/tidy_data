//setting the paths of various files 
x_train_path <- file.path(".","train","X_train.txt")
feature_path <- file.path(".","features.txt")
subject_train_path <- file.path(".","train","subject_train.txt")
labels_train_path <- file.path(".","train","y_train.txt")
x_test_path <- file.path(".","test","X_test.txt")
subject_test_path <- file.path(".","test","subject_test.txt")
labels_test_path <- file.path(".","test","y_test.txt")

// reading Train data set and features
X_train <- read.table(x_train_path)
feature_name <- read.table(feature_path)

// filter out the indices and the names of columns which are either emans or std dev
indices <- grep("mean|std",feature_name[,2])
values <- grep("mean|std",feature_name[,2],value = TRUE)

// Filter out the data corresponding to above filter columns
X_train_data <- X_train[,indices]
// Assign column names to data from above features values
colnames(X_train_data) <- values
subject_train <- read.table(subject_train_path)
// Added column of subjects
X_train_data<-mutate(X_train_data,subject=subject_train[,1])
labels_train <- read.table(labels_train_path)

// similar operations for test data as above
X_test <- read.table(x_test_path)
X_test_data <- X_test[,indices]
colnames(X_test_data) <- values
subject_test <- read.table(subject_test_path)
X_test_data<-mutate(X_test_data,subject=subject_test[,1])
labels_test <- read.table(labels_test_path)

// reading activity names corresponding to labels
act_path <- file.path(".","activity_labels.txt")
activity_labels <- read.table(act_path)

// adding label column with labels being substituted with their corresponding values from activity data
X_test_data <- mutate(X_test_data,labels = activity_labels$V2[match(labels_test[,1],activity_labels$V1)])
X_train_data <- mutate(X_train_data,labels = activity_labels$V2[match(labels_train[,1],activity_labels$V1)])

// merge both test and train data
final_data <- rbind(X_train_data,X_test_data)
colnames(final_data) <- colnames(X_test_data)

// finding average per subject and activity
tidy_data <- ddply(final_data,.(subject,labels), numcolwise(mean))

