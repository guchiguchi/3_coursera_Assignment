#library
library(tidyverse)

#prepare data sets-------------------------------------------------------------------------

#download file
download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
              destfile = "Dataset.zip")
#unzip
unzip("Dataset.zip")


#Merges the training and the test sets to create one data set----------------------------------

## Read in Activity sets

activity_labels <- read_table2("UCI HAR Dataset/activity_labels.txt", col_names = FALSE)
colnames(activity_labels) <- c("colnumber", "activity")

features <- read_table2("UCI HAR Dataset/features.txt",  col_names = FALSE)
colnames(features) <- c("colnumber", "features")


## Read in train sets

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE, col.names = "subject")

X_train <- read_table2("UCI HAR Dataset/train/X_train.txt", col_names = FALSE)    #dim(X_train) [1] 7352  561
colnames(X_train) <- features$features

y_train <- read_csv("UCI HAR Dataset/train/y_train.txt", col_names = "num")


##Read in test sets

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE, col.names = "subject")

X_test <- read_table2("UCI HAR Dataset/test/X_test.txt", col_names = FALSE)
#dim(X_test) [1] 2947  561
colnames(X_test) <- features$features

y_test <- read.table("UCI HAR Dataset/test/y_test.txt", sep = "", header = FALSE, col.names = "num")


##combine the test and training data sets

x_all <- bind_rows(X_train, X_test)
y_all <- bind_rows(y_train, y_test)
subj_all <- bind_rows(subject_train, subject_test)

##Combine x_all, y_all and subj_all 

all <- cbind(subj_all, y_all, x_all)


#Extracts only the measurements on the mean and standard deviation for each measurement.---------------------

all_colnames_meanstd <- all %>% select(subject, num, contains("mean"), contains("std"))


#Uses descriptive activity names to name the activities in the data set---------------------------

all_colnames_meanstd <- left_join(all_colnames_meanstd, activity_labels, by = c("num" = "colnumber"))

all_colnames_meanstd  <- 
  all_colnames_meanstd %>% 
  select(subject, num, activity, 3:88) %>% 
  arrange(subject, num)

all_colnames_meanstd$subject <- as.factor(all_colnames_meanstd$subject)
all_colnames_meanstd$num <- as.factor(all_colnames_meanstd$num)

all_colnames_meanstd %>% View()

##Create a 'tidy' dataset


all_gather <- all_colnames_meanstd %>% 
  gather("features2", "measurement", 4:89)  # glimpse(harSubLong)


#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.----------------------------

##Summarise

all_summary <-
  all_gather %>% 
  group_by(subject, num, features2) %>% 
  summarise(avg_measurement = mean(measurement)) %>% 
  ungroup() %>% 
  arrange(subject, num, features2)


#Write csv------------------------------------------------------------------

write.csv(all_gather, "all_gather.csv")

write.csv(all_summary, "all_summary.csv")
