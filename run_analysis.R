#reading testing and training data from files
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

#reading column names for the data
features <- read.table('./UCI HAR Dataset/features.txt')
activityLabels = read.table('./UCI HAR Dataset/activity_labels.txt')

#setting column names for data sets
colnames(x_train) <- features[,2] 
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

colnames(activityLabels) <- c('activityId','activityType')

#merging testing and training data separately
test_data <- cbind(x_train,y_train,subject_train)
train_data <- cbind(x_test,y_test,subject_test)

#merging testing and training data together
final_data<- rbind(test_data,train_data)

#getting column names for final data set
clnames <- colnames(final_data)

#defining measurements performed on main data set in the dataset
attributes_flag<- (grepl("activityId",clnames) |
    grepl("subjectId",clnames) |
    grepl("mean..",clnames)|
    grepl("std..",clnames)  
      )
#subsetting from main data set
attributes_data<- final_data[,attributes_flag==TRUE]

#naming the activities in the subset of attibutes data
attributes_name_data <- merge(attributes_data, activityLabels, by='activityId', all.x=TRUE)

#making a tidy data set for output
Final_tidy_set <- aggregate(. ~subjectId + activityId, attributes_name_data, mean)
Final_tidy_set <- Final_tidy_set[order(Final_tidy_set$subjectId, Final_tidy_set$activityId),]

#output the tidy data set to text file
write.table(Final_tidy_set, "Final_tidy_set.txt", row.name=FALSE)
