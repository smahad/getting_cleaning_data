setwd("C:/Users/PRATAP/Desktop/1.smita-technical/Data_Scientist/data/UCI HAR Dataset")

library(data.table)
library(plyr)
library(dplyr)

#Read  training data
features <- read.table("./features.txt")
xTrain <- read.table("./train/X_train.txt")
yTrain <- read.table("./train/y_train.txt")
subjectTrain <- read.table("./train/subject_train.txt")

#read Test data
xTest <- read.table("./test/X_test.txt")
yTest <- read.table("./test/y_test.txt")
subjectTest <- read.table("./test/subject_test.txt")

#Assign column names to X test  and train data
colnames(xTrain) <- features[,2]
colnames(xTest) <- features[,2]

#Add Activities and participants data to X data
xTrain$activities <- yTrain[,1]
xTrain$participants <- subjectTrain[,1]
xTest$activities <- yTest[,1]
xTest$participants <- subjectTest[,1]

#Merge Train and Test data 
xMaster <- rbind(xTrain,xTest)
xMaster <- xMaster[, !duplicated(colnames(xMaster))]

# Extracts only the measurements on the mean and standard deviation for each measurement. 
meanFeatures <- grep("mean()",ignore.case = TRUE,colnames(xMaster))
meanData <- xMaster[meanFeatures]
meanFeatures <- grep("mean()",ignore.case = TRUE,names(xMaster))
meanData <- xMaster[meanFeatures]
std <- grep("std()",colnames(xMaster))
stdData <- xMaster[std]

#Uses descriptive activity names to name the activities in the data set
xMaster$activities[xMaster$activities==1] <- "Walking"
xMaster$activities[xMaster$activities==2] <- "WALKING_UPSTAIRS"
xMaster$activities[xMaster$activities==3] <- "WALKING_DOWNSTAIRS"
xMaster$activities[xMaster$activities==4] <- "SITTING"
xMaster$activities[xMaster$activities==5] <- "STANDING"
xMaster$activities[xMaster$activities==6] <- "LAYING"

#Appropriately labels the data set with descriptive variable names
colnames(xMaster) <- gsub("Acc","Accelerator",colnames(xMaster))
colnames(xMaster) <- gsub("Gyro","Gyroscope",colnames(xMaster))
colnames(xMaster) <- gsub("Mag","Magnitude",colnames(xMaster))
colnames(xMaster) <- gsub("^f","Frequency",colnames(xMaster))
colnames(xMaster) <- gsub("^t","Time",colnames(xMaster))

xMaster$participants <- paste("Participant", xMaster$participants)

#create Tidy data
xMaster <- data.table(xMaster)
tidyData <- xMaster[,lapply(.SD,mean),by= 'participants,activities']
write.table(tidyData, file = "Tidy.txt", row.names = FALSE)
