# Coursera JHPH Data Science
# 003 - 
# Week 3 | Course Project
# Collect and clean, prepare tidy data -- Samsung Galaxy S smartphone accelerometer data
#
# Joe Nguyen | 27 Sep, 2015

# Change working directory
dirBase <- "/home/joe/Documents/A2-Career/A001-learning-development/001-Data-Science/Coursera-Jul2015"
dirWorking <- "/003-clean-data/02-cprj"
setwd(file.path(dirBase, dirWorking))
rm(list = ls())
gc(reset = TRUE)

harfiles <- unzip("./getdata_projectfiles_UCI HAR Dataset.zip")
# numfiles <- length(harfiles)

###################################################################
## 1. Merges the training and the test sets to create one data set.
###################################################################
# Read [feature vectors (X), activity_label (y), subject]
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
s_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
s_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

features <- read.table("./UCI HAR Dataset/features.txt")
features <- as.character(features[,2])
numFeatures <- length(features)


########################################################################
## 4. Appropriately label the data set with descriptive variable names. 
########################################################################
# Create data frame and assign variable names
hardata00 <- data.frame(rbind(X_train, X_test), rbind(y_train, y_test), rbind(s_train, s_test))
colnames(hardata00) <- c(features, "activity", "subject")


##########################################################################
## 2. Extracts only the measurements on mean and std for each measurement.
##########################################################################
keywords <- c("mean", "std", "Mean")

# Find variable indices (columns of df) with keywords in variable names
featureIdxLs <- sapply(features, function(x,y) { grep(paste(y, collapse = "|"), x) }, y = keywords)
featureIdxLs <- which(as.logical(featureIdxLs))

# Extraction
hardata01 <- hardata00[, c(features[featureIdxLs], "activity", "subject")]


#############################################################################
## 3. Uses descriptive activity names to name the activities in the data set.
#############################################################################
library(dplyr)
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
hardata01 <- rename(hardata01, act = activity) %>%
    mutate(activity = sapply(act, function(x,y) { x = y[x] }, y = activityLabels[,2] )) %>%
    select(-act)


########################################################################
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
########################################################################
hardata02 <- group_by(hardata01, activity, subject) %>%
    summarise_each(funs(mean))
# 30 obs. = 6 activities * 30 subjects


## Write to .txt file
write.table(hardata02, "./tidy_data.txt", row.names = FALSE)


