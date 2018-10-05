# CJ Arayata: Getting and Cleaning Data Course Project

# Rubric:
# The submitted data set is tidy.
# The Github repo contains the required scripts.
# GitHub contains a code book (CodeBook.md) that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
# The README.md that explains the analysis files is clear and understandable.
# The work submitted for this project is the work of the student who submitted it.

# Set up ####
setwd("U:/datasciencecoursera/3. Getting and Cleaning Data/Course Project")
# setwd("C:/Users/cj/Desktop/UCI HAR Dataset")
library(tidyverse)
library(plyr)
library(dplyr)

# 1. Merges the training and the test sets to create one data set. ####

# First, load x (561 features) and rbind the training and test sets
x.train <- read.table("train/X_train.txt")
x.test <- read.table("test/X_test.txt")

x.all <- rbind(x.train, x.test)

# 4. Appropriately labels the data set with descriptive variable names. ####

# The names of these features are provided in a different file
features <- read.table("features.txt")
names(x.all) <- features$V2

# Create index for merging
x.all$index <- seq(1, nrow(x.all), by = 1)

rm(x.train, x.test)

# 3. Uses descriptive activity names to name the activities in the data set ####

# Adding Y: activity labels
y.train <- read.table("train/y_train.txt")
y.test <- read.table("test/y_test.txt")

y.all <- rbind(y.train, y.test)

# Create index for merging
y.all$index <- seq(1, nrow(y.all), by = 1)

# Read in codebook for labels
activity.labels <- read.table("activity_labels.txt")
labels <- merge(y.all, activity.labels) 

rownames(labels) <- labels$index

# Clean a bit
names(labels) <- c("activity.code", "index", "activity.name")


# Now, add in Subject information ####
train.subjects <- read.table("train/subject_train.txt")
test.subjects <- read.table("test/subject_test.txt")

all.subjects <- c(train.subjects[, 1], test.subjects[, 1])

all.subjects <- data.frame(subject.id = all.subjects,
                           index = seq(1, length(all.subjects), by = 1))

# Multiple merges, not pretty, but gets the job done
one <- merge(all.subjects, labels, by = "index")
two <- merge(one, x.all, by = "index")

# data <- join_all(dflist) %>% 
#         arrange(index)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. ####

# Select colnames that contain mean() or std() or Mean
target.vars <- two[, grepl("mean()|std()|Mean", names(two))]

# Create new data.frame with the identifying info plus the trimmed features
data <- cbind(two[, c(1:4)],
              target.vars)

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Use ddply and numcolwise to do means for numeric columns
data2 <- ddply(data, .(subject.id, activity.name),
               numcolwise(mean))

# Index is not helpful here, so remove it
data2 <- select(data2, -index)

# Clean up environment
rm(activity.labels, all.subjects, features, labels, one, two, target.vars, test.subjects, train.subjects,
   x.all, y.all, y.test, y.train)
