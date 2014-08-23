## Data Science Getting and Cleaning Data

wrkDir <- "/home/eric/Documents/Coursea/DataScience/getData/CourseProject"
wrkDir <- paste0(wrkDir, "/UCI HAR Dataset")
setwd(wrkDir)


## reading in the activity lables and features for assignment ####
actLabel <- read.table("activity_labels.txt")
names(actLabel) <- c("actID", "activity")

features <- read.table("features.txt")
features[,1] <- NULL
names(features) <- "variable"

## test data set ####
testSubject <- read.table("./test/subject_test.txt")    # person ID
testX <- read.table("./test/X_test.txt")                # measures
testY <- read.table("./test/y_test.txt")                # activity ID

## train data set ####
trainSubject <- read.table("./train/subject_train.txt")
trainX <- read.table("./train/X_train.txt")
trainY <- read.table("./train/y_train.txt")

## assigning variable names (features) to data set X's ####
names(testX) <- features[,1]
names(trainX) <- features[,1]

## find the columns with mean() and std() in the variable name ####
## and delete the rest to create newX as a new df
a <- grep("mean()", features[,1])
b <- grep("std()", features[,1])
c <- sort(c(a, b)) # sorted list of columns in X contain mean or std
newTestX <- testX[,c]
newTrainX <- trainX[,c]

## combine the subject and activity, then create the tidy data set ####
newTest <- cbind(testSubject, testY, newTestX)
newTrain <- cbind(trainSubject, trainY, newTrainX)
names(newTest)[1:2] <- c("subject", "activity")
names(newTrain)[1:2] <- c("subject", "activity")

tidy <- rbind(newTest, newTrain)
tidy <- merge(actLabel, tidy, by.x="actID", by.y="activity")
tidy$actID <- NULL

## write the data frame to a text file ####
write.table(tidy, "../tidyData.txt", row.names=FALSE)

## create another data set containing average of each varaiable ####
## broken by activity and subject
library(reshape2)
tidyMelt <- melt(tidy, id=c("actID", "activity", "subject"))
tidyAvg <- dcast(tidyMelt, activity + subject ~ variable, mean)
write.table(tidyAvg, "../tidyAvg.txt", row.names=FALSE)

## Writes the column names to a text file for later edit ####
#tidyDataNames <- names(tidy)
#write.table(tidyDataNames, "../codebook.txt", quote=FALSE,row.names=FALSE
#            ,col.names=FALSE)




