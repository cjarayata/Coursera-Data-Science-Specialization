# CJ Arayata: Getting and Cleaning Data Course Project

# Rubric:
# The submitted data set is tidy.
# The Github repo contains the required scripts.
# GitHub contains a code book (CodeBook.md) that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
# The README.md that explains the analysis files is clear and understandable.
# The work submitted for this project is the work of the student who submitted it.

# run_analysis.R
# 1. Merges the training and the test sets to create one data set.
setwd("U:/datasciencecoursera/3. Getting and Cleaning Data/Course Project")

# first, x
x.train <- read.table("train/X_train.txt")
x.test <- read.table("test/X_test.txt")

x.all <- rbind(x.train, x.test)

rm(x.train, x.test)

# colnames are the features
features <- read.table("features.txt")
names(x.all) <- features$V2

rm(features)

# features_info <- read.table("features_info.txt")


# need to add Y too: activity labels
y.train <- read.table("train/y_train.txt")
y.test <- read.table("test/y_test.txt")

y.all <- rbind(y.train, y.test)

activity.labels <- read.table("activity_labels.txt")

# activity.labels$V1 <- factor(activity.labels$V1,
#                              levels = activity.labels$V1,
#                              labels = activity.labels$V2)
# labels <- merge(y.all, activity.labels) # this loses row order...
# recode function?

train.subjects <- read.table("train/subject_train.txt")
test.subjects <- read.table("test/subject_test.txt")

all.subjects <- c(train.subjects[, 1], test.subjects[, 1])

x.all <- data.frame(subject = all.subjects,
                    x.all)

whaa# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

