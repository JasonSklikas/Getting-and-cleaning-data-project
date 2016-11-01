
#1.Merges the training and the test sets to create one data set.

#Load the train info
x_train<- read.table("train/x_train.txt")
y_train<- read.table("train/y_train.txt")
trainsubject<- read.table("train/subject_train.txt")

#load the test info
x_test<-read.table("test/x_test.txt")
y_test<-read.table("test/y_test.txt")
testsubject<-read.table("test/subject_test.txt")

#Create the data sets
xdata<- rbind(x_train,x_test)
ydata<- rbind(y_train,y_test)
subjectdata<- rbind(trainsubject,testsubject)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

# #load the features
features<- read.table("features.txt")

#Extract only the mean and std
mean_n_std_features<- grep(".*mean.*|.*std.*", features[,2])

##Tidy x_data, set column names
xdata<- xdata[, mean_n_std_features]
names(xdata) <-features[mean_n_std_features,2]


# 3. Uses descriptive activity names to name the activities in the data set

#Load activities and tidy them
activities<- read.table("activity_labels.txt")
activities[,2]<- gsub("_"," ", tolower(as.character(activities[,2])))
names(xdata) <- gsub("-mean","mean",names(xdata)) #Remove -mean
names(xdata) <- gsub("-std","std",names(xdata)) #Remove -std
names(xdata) <- gsub("[()-]","",names(xdata))
names(xdata) <- tolower(names(xdata))
names(xdata) <- gsub("^t","time",names(xdata))
names(xdata) <- gsub("^f","frequency",names(xdata))
names(xdata) <- gsub("acc","accelerometer",names(xdata))
names(xdata) <- gsub("gyro","gyroscope",names(xdata))
names(xdata) <- gsub("bodybody","body",names(xdata))
names(xdata) <- gsub("mag","magnitude",names(xdata))

#replace 1-6 into the activities names,so ydata now has as values the activity names
ydata[,1]<-activities[ydata[,1],2]

#Set the column names activity and subject
names(ydata)<- "activity"
names(subjectdata)<-"subject"

#Create the final data set
clean_data<- cbind(subjectdata,ydata,xdata)
write.table(clean_data, "clean_data.txt")

# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.
library(plyr)
data2<-aggregate(.~subject+activity,clean_data,mean)
data2<-data2[order(data2$subject,data2$activity), ]
Average_data<-data2
write.table(Average_data,file = "tidy_data_average.txt", row.name=FALSE)


