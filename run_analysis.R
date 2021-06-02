# Merge the training and the test sets to create one data set.

# file.exists
dir.create("../UCI HAR Dataset Merged")
dir.create("../UCI HAR Dataset Merged/test_train")

subject_test <- read.delim("../UCI HAR Dataset/test/subject_test.txt", header = FALSE, sep="\n")
subject_train <- read.delim("../UCI HAR Dataset/train/subject_train.txt", header = FALSE, sep="\n")
subject_test_train_merged <- rbind(subject_test, subject_train)

write.csv(subject_test_train_merged,"../UCI HAR Dataset Merged/test_train/subject_test_train.csv", row.names = FALSE)

# re-read
# subject_test_train <- read.csv("../UCI HAR Dataset Merged/test_train/subject_test_train.csv", header = FALSE, sep="\n")
