# copy the folder UCI HAR Dataset to the current working directory
setwd("UCI HAR Dataset")	#setting working directory to UCI HAR Dataset
#reading all the files into R

act_lab<-read.table("activity_labels.txt")
features<-read.table("features.txt")
x_test<-read.table("./test/X_test.txt")
y_test<-read.table("./test/Y_test.txt")
sub_test<-read.table("./test/Subject_test.txt")
x_train<-read.table("./train/X_train.txt")
Y_train<-read.table("./train/Y_train.txt")
sub_train<-read.table("./train/Subject_train.txt")

#1. merging the datasets to get one data set

new_data<- rbind(cbind(sub_test,y_test,x_test),cbind(sub_train,Y_train,x_train))

#2.extracting measurements on only mean and s.d

name<-grepl("mean|std",features[,2]) #search for names containing mean or std
fin_data<-new_data[,c(TRUE,TRUE,name)] #stores the values of subject id,activity id, mean and std

#3.giving  descriptive activity names to name the activities

fin_data[,2]=as.factor(fin_data[,2])
levels(fin_data)<-as.factor(act_lab[,2])

#4labeling the dataset

names(fin_data)<-c("subjectid","activitytype",as.character(features[name,2]))
names(fin_data)<-gsub("\\(\\)","",names(fin_data))
names(fin_data)<-gsub("-","",names(fin_data))


#5 creating independent dataset

library(dplyr)
ind_set<-fin_data%>% group_by(subjectid,activitytype) %>% summarise_each(funs(mean))
write.table(ind_set,"independentdataset.txt")

