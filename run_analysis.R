# Merge the training and the test sets to create one data set.

if (file.exists("../UCI HAR Dataset Merged")) { stop("'../UCI HAR Dataset Merged' directory already exists, please delete manually") }

dir.create("../UCI HAR Dataset Merged")
dir.create("../UCI HAR Dataset Merged/test_train")
dir.create("../UCI HAR Dataset Merged/test_train/Inertial Signals")

# read in required top level files that don't need to be merged, then write out to new folder as .csv
features_file <- read.delim("../UCI HAR Dataset/features.txt", header = FALSE, sep=" ")
write.table(features_file, "../UCI HAR Dataset Merged/features.csv", row.names = FALSE, col.names = FALSE, sep=",")
activity_labels_file <- read.delim("../UCI HAR Dataset/activity_labels.txt", header = FALSE, sep=" ")
write.table(activity_labels_file, "../UCI HAR Dataset Merged/activity_labels.csv", row.names = FALSE, col.names = FALSE, sep=",")

# generalised function for merging and writing test and train files as .csv
merge_write <- function(base_path, file_name, separator) {
  test <- read.delim(paste0(base_path, "/test/", file_name, "_test.txt"), header = FALSE, sep=separator)
  train <- read.delim(paste0(base_path, "/train/", file_name, "_train.txt"), header = FALSE, sep=separator)
  test_train_merged <- rbind(test, train)
  write.table(test_train_merged, paste0(base_path, " Merged/test_train/", file_name, "_test_train.csv"), row.names = FALSE, col.names = FALSE, sep=",")
}

merge_write("../UCI HAR Dataset", "X", "")
merge_write("../UCI HAR Dataset", "subject", "\n")
merge_write("../UCI HAR Dataset", "y", "")
merge_write("../UCI HAR Dataset", "Inertial Signals/body_acc_x", "")
merge_write("../UCI HAR Dataset", "Inertial Signals/body_gyro_x", "")
merge_write("../UCI HAR Dataset", "Inertial Signals/total_acc_x", "")
merge_write("../UCI HAR Dataset", "Inertial Signals/body_acc_y", "")
merge_write("../UCI HAR Dataset", "Inertial Signals/body_gyro_y", "")
merge_write("../UCI HAR Dataset", "Inertial Signals/total_acc_y", "")
merge_write("../UCI HAR Dataset", "Inertial Signals/body_acc_z", "")
merge_write("../UCI HAR Dataset", "Inertial Signals/body_gyro_z", "")
merge_write("../UCI HAR Dataset", "Inertial Signals/total_acc_z", "")

# re-read in merged files (only the ones we need for our tidy sets)

activity_labels <- read.csv("../UCI HAR Dataset Merged/activity_labels.csv", header = FALSE)
features <- read.csv("../UCI HAR Dataset Merged/features.csv", header = FALSE)
X <- read.csv("../UCI HAR Dataset Merged/test_train/X_test_train.csv", header = FALSE)
subject <- read.csv("../UCI HAR Dataset Merged/test_train/subject_test_train.csv", header = FALSE)
y <- read.csv("../UCI HAR Dataset Merged/test_train/y_test_train.csv", header = FALSE)
