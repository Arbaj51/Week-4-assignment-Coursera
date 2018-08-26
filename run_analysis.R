
X_train<-read.table(file = "./UCI HAR Dataset/train/X_train.txt")
Y_train<-read.table(file = "./UCI HAR Dataset/train/Y_train.txt")
Subject_train<-read.table(file = "./UCI HAR Dataset/train/subject_train.txt")

X_test<-read.table(file = "./UCI HAR Dataset/test/X_test.txt")
Y_test<-read.table(file = "./UCI HAR Dataset/test/Y_test.txt")
Subject_test<-read.table(file = "./UCI HAR Dataset/test/subject_test.txt")

features<- read.table(file = "./UCI HAR Dataset/features.txt")
activity_labels<- read.table(file = "./UCI HAR Dataset/activity_labels.txt")


X_total<-rbind(X_train,X_test)

Y_total<-rbind(Y_train,Y_test)

Subject_total<-rbind(Subject_train,Subject_test)

s_features<-features[grep("*mean\\(\\)|*std\\(\\)",features[,2]),]
X_total<- X_total[,s_features[,1]]

colnames(Y_total)<-"activity"

Y_total$activitylabel<-factor(Y_total$activity, labels = as.character(activity_labels[,2]))

activitylabel<- Y_total[,-1]

colnames(X_total)<-features[s_features[,1],2]


colnames(Subject_total)<-"subject"
total<-cbind(X_total,activitylabel,Subject_total)

total_means<- total %>% group_by(activitylabel,subject) %>% summarise_all(funs(mean))














