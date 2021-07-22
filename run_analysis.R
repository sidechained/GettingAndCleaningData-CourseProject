# 1. Merging and writing

if (file.exists("UCI HAR Dataset Merged")) { stop("'UCI HAR Dataset Merged' directory already exists, please delete manually") }

dir.create("UCI HAR Dataset Merged")
dir.create("UCI HAR Dataset Merged/test_train")
dir.create("UCI HAR Dataset Merged/test_train/Inertial Signals")

## read in required top level files that don't need to be merged, then write out to new folder as .csv
features_file <- read.delim("UCI HAR Dataset/features.txt", header = FALSE, sep=" ")
write.table(features_file, "UCI HAR Dataset Merged/features.csv", row.names = FALSE, col.names = FALSE, sep=",")
activity_labels_file <- read.delim("UCI HAR Dataset/activity_labels.txt", header = FALSE, sep=" ")
write.table(activity_labels_file, "UCI HAR Dataset Merged/activity_labels.csv", row.names = FALSE, col.names = FALSE, sep=",")

## generalised function for merging and writing test and train files as .csv
merge_write <- function(base_path, file_name, separator) {
  test <- read.delim(paste0(base_path, "/test/", file_name, "_test.txt"), header = FALSE, sep=separator)
  train <- read.delim(paste0(base_path, "/train/", file_name, "_train.txt"), header = FALSE, sep=separator)
  test_train_merged <- rbind(test, train)
  write.table(test_train_merged, paste0(base_path, " Merged/test_train/", file_name, "_test_train.csv"), row.names = FALSE, col.names = FALSE, sep=",")
}

merge_write("UCI HAR Dataset", "X", "")
merge_write("UCI HAR Dataset", "subject", "\n")
merge_write("UCI HAR Dataset", "y", "")
merge_write("UCI HAR Dataset", "Inertial Signals/body_acc_x", "")
merge_write("UCI HAR Dataset", "Inertial Signals/body_gyro_x", "")
merge_write("UCI HAR Dataset", "Inertial Signals/total_acc_x", "")
merge_write("UCI HAR Dataset", "Inertial Signals/body_acc_y", "")
merge_write("UCI HAR Dataset", "Inertial Signals/body_gyro_y", "")
merge_write("UCI HAR Dataset", "Inertial Signals/total_acc_y", "")
merge_write("UCI HAR Dataset", "Inertial Signals/body_acc_z", "")
merge_write("UCI HAR Dataset", "Inertial Signals/body_gyro_z", "")
merge_write("UCI HAR Dataset", "Inertial Signals/total_acc_z", "")

# 2. Re-reading merged files (only the ones we need for our tidy sets)

activity_labels <- read.csv("UCI HAR Dataset Merged/activity_labels.csv", header = FALSE)
features <- read.csv("UCI HAR Dataset Merged/features.csv", header = FALSE)
X <- read.csv("UCI HAR Dataset Merged/test_train/X_test_train.csv", header = FALSE)
subject <- read.csv("UCI HAR Dataset Merged/test_train/subject_test_train.csv", header = FALSE)
y <- read.csv("UCI HAR Dataset Merged/test_train/y_test_train.csv", header = FALSE)

# 3. Extracting only the features representing mean and standard deviation
## treats X frame (features) as the master data frame, and adds columns to that

library("dplyr")
feature_indices_to_keep <- grep("mean|std", features[,2]) # operates on 2nd column of 'features' (i.e. the feature names)
feature_labels_to_keep <- grep("mean|std", features[,2], value = TRUE)
master_frame <- select(X, all_of(feature_indices_to_keep))
names(master_frame) <- feature_labels_to_keep

# add column of person indices
library("tibble") # required for 'add column' function
master_frame <- add_column(master_frame, subject, .before = 1) # add as first column
names(master_frame)[1] <- ("personindex")

# add column of activities names (names looked up from 'activity_labels.csv')
master_frame <- add_column(master_frame, y, .before = 2)
master_frame[,2] <- sapply(master_frame[,2], function(x) { activity_labels$V2[x] }) # V2 operates on 2nd column of 'y' (i.e. the activity names)
names(master_frame)[2] <- ("activityname")

# Appropriately labels the data set with descriptive variable names
names(master_frame) <- tolower(gsub("[^[:alnum:] ]", "", names(master_frame)))

# 4. Calculation of averages for each feature measurement (grouped by activity name and person index)
averages <- master_frame %>% group_by(personindex, activityname) %>% summarise_all(mean) %>% rename_with(function(x) {paste0(x, "-avg")}, -1:-2)
write.table(averages, "UCI-HAR_tidyData.txt", row.name=FALSE) # writing to file