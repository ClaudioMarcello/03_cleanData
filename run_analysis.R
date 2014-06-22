# 1.Merges the training and the test sets to create one data set.
# 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3.Uses descriptive activity names to name the activities in the data set
# 4.Appropriately labels the data set with descriptive variable names. 
# 5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

#______________________________________________________________
# 1.Merges the training and the test sets to create one data set.
fileName <- "train/X_train.txt"
meas.train <- read.table(fileName, sep = "" , header = F , stringsAsFactors= F)
fileName <- "test/X_test.txt"
meas.test <- read.table(fileName, sep = "" , header = F , stringsAsFactors= F)
meas.all <- rbind(meas.train, meas.test)

#______________________________________________________________
# 4.Appropriately labels the data set with descriptive variable names. 
fileName <- "features.txt"
features <- read.table(fileName, sep = "" , header = F , stringsAsFactors= F)
names(meas.all) <- features$V2

#______________________________________________________________
# 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
index <- with(features, (grepl("mean()", V2) | grepl("std()", V2)) & !grepl("meanFreq()", V2))
meas.summ <- meas.all[, features$V2[index]]

#______________________________________________________________
# 3.Uses descriptive activity names to name the activities in the data set
# 3.1 Merge subjects
fileName <- "train/subject_train.txt"
subject.train <- read.table(fileName, sep = "" , header = F , stringsAsFactors= F)
fileName <- "test/subject_test.txt"
subject.test <- read.table(fileName, sep = "" , header = F , stringsAsFactors= F)
subject <- rbind(subject.train, subject.test)
names(subject) <- "subject"

# 3.2 Mergue activities
fileName <- "train/y_train.txt"
activity.train <- read.table(fileName, sep = "" , header = F , stringsAsFactors= F)
fileName <- "test/y_test.txt"
activity.test <- read.table(fileName, sep = "" , header = F , stringsAsFactors= F)
activity.code <- rbind(activity.train, activity.test)
# Map activity code into activity name
activity.name <- c("walking", "walking.upstairs", "walking_downstairs", "sitting", "standing", "laying")
lbl <- function(n) activity.name[n]
activity <- data.frame(activity = sapply(activity.code$V1, lbl), stringsAsFactors = F)

# 3.3 Merge subject, activity and measurements
meas.summ <- cbind(subject, activity, meas.summ)

#______________________________________________________________
# 5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
library(reshape2)
meas.melt <- melt(meas.summ, id = c("subject", "activity"))
meas.short <- dcast(meas.melt, subject + activity ~ variable, mean)

#______________________________________________________________
# Write tidy data set to text file
filename <- "meas.txt"
write.table(meas.short, filename, sep="\t", row.names=F)
