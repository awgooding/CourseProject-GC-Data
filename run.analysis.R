##Getting and Cleaning Data Course Project
##12/21/2014



##Merges the training and the test sets to create one data set.

data_train_x<-read.table("C:/Users/Andrew/Desktop/UCI Har Dataset/Train/X_train.txt",
                         header=FALSE,colClasses = "numeric",
                         stringsAsFactors = FALSE)
data_train_y<-read.table("C:/Users/Andrew/Desktop/UCI Har Dataset/Train/Y_train.txt",
                         header=FALSE,colClasses = "factor",
                         stringsAsFactors = FALSE)
data_train_subject<-read.table("C:/Users/Andrew/Desktop/UCI Har Dataset/Train/subject_train.txt",
                               header=FALSE,colClasses = "factor",
                               stringsAsFactors = FALSE)

data_test_x<-read.table("C:/Users/Andrew/Desktop/UCI Har Dataset/Test/X_test.txt",
                        header=FALSE,colClasses = "numeric",
                        stringsAsFactors = FALSE)
data_test_y<-read.table("C:/Users/Andrew/Desktop/UCI Har Dataset/Test/Y_test.txt",
                        header=FALSE,colClasses = "factor",
                        stringsAsFactors = FALSE)
data_test_subject<-read.table("C:/Users/Andrew/Desktop/UCI Har Dataset/Test/subject_test.txt",
                              header=FALSE,colClasses = "factor",
                              stringsAsFactors = FALSE)


##creates Experimental_Group identifier vector for both data sets

train_label<-rep("train",times = dim(data_train_y)[1])
test_label<-rep("test",times = dim(data_test_y)[1])


##binds Experimental_Group labels, X_ data, and Y_ data to create a data frame for each
##experimental_group

data_train<-cbind(data_train_subject,train_label,data_train_y,data_train_x)
data_test<-cbind(data_test_subject,test_label,data_test_y,data_test_x)



## reads in feature labels and creates a column names vector

data_features<-read.table("C:/Users/Andrew/Desktop/UCI Har Dataset/features.txt",
                          header = FALSE,
                          stringsAsFactors = FALSE)

data_features<-c("Subject","Experimental_Group","Activity_Label",data_features[,2])


##names data sets with column names from data_features

names(data_train)<-data_features
names(data_test)<-data_features


##reads in activity labels and appropriately names the levels of both Test and Train 

activity_labels<-read.table("C:/Users/Andrew/Desktop/UCI Har Dataset/activity_labels.txt",
                            header=FALSE,colClasses = c("numeric","character"),
                            stringsAsFactors = FALSE)

activity_labels<-activity_labels[,2]

levels(data_test$Activity_Label)<-activity_labels
levels(data_train$Activity_Label)<-activity_labels

write.table(data_train,"C:/Users/Andrew/Desktop/UCI Har Dataset/train/data_train.txt", row.name = FALSE)
write.table(data_test,"C:/Users/Andrew/Desktop/UCI Har Dataset/test/data_test.txt", row.name = FALSE)

##binds two data sets together to create merged data set (data_merged)

data_merged<-rbind(data_train, data_test)

write.table(data_merged,"C:/Users/Andrew/Desktop/UCI Har Dataset/data_merged.txt", row.name = FALSE)


##Extracts only the measurements on the mean and standard deviation for each measurement. 

mean_col_index<-grepl("mean()",names(data_merged))
std_col_index<-grepl("std()",names(data_merged))

##creates col_index of selected mean and std columns, forces 1:3 to be TRUE to preserve
##identifying columns

mean_or_std_col_index<-(mean_col_index | std_col_index)
mean_or_std_col_index[1:3]<-as.logical(TRUE)

data_mean_and_std<-data_merged[,mean_or_std_col_index]

write.table(data_mean_and_std,
            "C:/Users/Andrew/Desktop/UCI Har Dataset/data_all_mean_and_std_columns.txt",
            row.name = FALSE)


##From the data set in step 4, creates a second, independent tidy data set with
##the average of each variable for each activity and each subject.

#aggregates merged data set by Experimental_Group, Activity_Label, and Subject.
##creates a table of the mean of each aggregated group

data_merged_means<-aggregate(data_mean_and_std[,-(1:3)],
                           by = list(Experimental_Group = data_mean_and_std$Experimental_Group,
                                     Activity_Label = data_mean_and_std$Activity_Label,
                                     Subject = data_mean_and_std$Subject),
                           FUN = mean, na.rm = TRUE)

#reorders columns so that Subject comes first.

data_merged_means<-data_merged_means[,c(3,1,2,4:82)]

write.table(data_merged_means,
            "C:/Users/Andrew/Desktop/UCI Har Dataset/data_means.txt", 
            row.name = FALSE)








