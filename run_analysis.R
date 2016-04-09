library(data.table)
library(plyr)
library(dplyr)

# Download the data
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if (!file.exists("UCI HAR Dataset")) {
  + download.file(fileURL, destfile="HAR.zip")
  + unzip("HAR.zip")}

#Read  training data
features <- read.table("UCI HAR Dataset/features.txt")
xTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("UCI HAR Dataset/train/y_train.txt")
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")

#read Test data
xTest <- read.table("UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("UCI HAR Dataset/test/y_test.txt")
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt")

#Assign column names to X test  and train data
colnames(xTrain) <- features[,2]
colnames(xTest) <- features[,2]

#Add activity and subject data to X data
xTrain$activity <- yTrain[,1]
xTrain$subject <- subjectTrain[,1]
xTest$activity <- yTest[,1]
xTest$subject <- subjectTest[,1]

#Merge Train and Test data 
xMaster <- rbind(xTrain,xTest)
xMaster <- xMaster[, !duplicated(colnames(xMaster))]

# Extracts only the measurements on the mean and standard deviation for each measurement. 
filtered_feature_ids <- grepl("mean|std|subject|activity", colnames(xMaster)) & !grepl("meanFreq", colnames(xMaster))
filteredData <- xMaster[filtered_feature_ids]

#Uses descriptive activity names to name the activity in the data set
filteredData$activity[filteredData$activity==1] <- "Walking"
filteredData$activity[filteredData$activity==2] <- "WALKING_UPSTAIRS"
filteredData$activity[filteredData$activity==3] <- "WALKING_DOWNSTAIRS"
filteredData$activity[filteredData$activity==4] <- "SITTING"
filteredData$activity[filteredData$activity==5] <- "STANDING"
filteredData$activity[filteredData$activity==6] <- "LAYING"

#Appropriately labels the data set with descriptive variable names
featureNames <- colnames(filteredData)
featureNames <- gsub("Acc","-acceleration",featureNames)
featureNames <- gsub("(Gyro|Jerk)","-\\1",featureNames)
featureNames <- gsub("Mag","-magnitude",featureNames)
featureNames <- gsub("^f(.*)$","\\1-frequency",featureNames)
featureNames <- gsub("^t(.*)$","\\1-time",featureNames)
featureNames <- gsub("\\(\\)","",featureNames)
featureNames <- gsub("BodyBody","body",featureNames)
featureNames <- tolower(as.list(featureNames))

colnames(filteredData) <- featureNames

filteredData$subject <- paste("Participant", filteredData$subject)

#create Tidy data
filteredData <- data.table(filteredData)
tidyData <- filteredData[,lapply(.SD,mean),by= 'subject,activity']
write.table(tidyData, file = "tidyData.txt", row.names = FALSE)
