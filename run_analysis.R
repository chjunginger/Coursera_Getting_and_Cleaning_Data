library(plyr)
#setwd("~/Desktop/Data_Science/coursera/UCI HAR Dataset")
#your working dir should be the UCI HAR Dataset folder

# Read and concatenate Datasets
subj<-rbind(read.table("train/subject_train.txt",header=FALSE),read.table("test/subject_test.txt",header=FALSE))
colnames(subj)<-"subjectID"
X<-rbind(read.table("train/X_train.txt",header=FALSE),read.table("test/X_test.txt",header=FALSE))
Y<-rbind(read.table("train/y_train.txt",header=FALSE),read.table("test/y_test.txt",header=FALSE))

# Getting the indices of the means and stds
features<-read.table("features.txt",header=FALSE)
indices<-as.numeric(features$V1[grepl("mean\\(\\)|std\\(\\)",features$V2)])
indices_names<-as.character(features$V2[indices])
indices_names<-(gsub("\\(\\)|-","",indices_names))
indices_names<-(gsub("mean","Mean",indices_names))
indices_names<-(gsub("std","Std",indices_names))

#Subsetting the measurements to only get means and stds,relabeling the dataset with descriptice variable names
X<-X[,indices]
colnames(X)<-indices_names

# relabel activities to make them descriptive
act<-read.table("activity_labels.txt",header=F)
activity<-merge(Y,act,x.by="V1",y.by="V2")$V2

#merge all data; clean dataset; aggregate (Step 5 of the task) and print to file
dataset<-cbind(subj,activity,X)
write.table(aggregate(dataset[,3:68], by = dataset[c("subjectID","activity")], FUN=mean),file="tidy_set_2.txt",row.name=FALSE)
