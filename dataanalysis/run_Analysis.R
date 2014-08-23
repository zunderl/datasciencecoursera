## Import data table
library(data.table)
## Merges the training and the test sets to create one data set.
## Extracts only the measurements on the mean and standard deviation for each measurement. 
## Uses descriptive activity names to name the activities in the data set
## Appropriately labels the data set with descriptive variable names. 
## Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## read X_train.txt
train_data <- read.table("X_train.txt") 
## read X_test.txt
test_data <- read.table("X_test.txt") 
## read feature vector
feature_list <- read.table("features.txt")
## read training subjects
train_subjects <- read.table("subject_train.txt")
## read training subjects
test_subjects <- read.table("subject_test.txt")
## read training types
train_types <- read.table("y_train.txt")
## read training types
test_types <- read.table("y_test.txt")
## read training types
activity_labels <- read.table("activity_labels.txt")

## merge data 
m_data<- rbind(train_data,test_data)
## merge subjects
m_subjects<-rbind(train_subjects,test_subjects)
## merge types
m_types<-rbind(train_types,test_types)

## Take indexes of columns which contain mean and standard deviation
rc<-grep("-mean|-std",feature_list$V2)
## Take only required columns from this and create required table
rt<-m_data[,rc]
## Assign Column Names
colnames(rt)<-feature_list$V2[rc]
## Get Subject Id
subject_id<-m_subjects$V1
## Get Activity Labels
activity<-activity_labels$V2[m_types$V1]
## Add subject_id
rt<-transform(rt,subject_id=subject_id)
## Add Activity
rt<-transform(rt,activity=activity)

# convert rt to table
rt_table<-data.table(rt)
## Aggregate based on Subject Id and Activity States 
aggregate_table<-rt_table[,lapply(.SD,mean(na.rm=TRUE)),by=list(subject_id,activity)]
# write the final tidy data set out to a file
write.table(aggregate_table,"tidy_data_set.txt", row.name=FALSE)
