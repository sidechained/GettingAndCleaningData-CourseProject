# Introduction

This file describes the tidying and analysis procedure performed by 'run_analysis.R', which can be summarised as follows:

# 1. Merging and writing

This section:
- Creates a new dataset folder called "UCI HAR Dataset Merged" in the top level folder, based on the original "UCI HAR Dataset"
- Reads in the original '.txt' files, merges them (when required) and writes them out as '.csv' files to the new dataset folder
- NOTE: At the top level of "UCI HAR Dataset" only the "features.txt" and "activity_labels.txt" file are bought over to the merged dataset with no merging being performed. If you need further documentation on these files, please refer to the extra files in the original dataset.
- The original "test" and "train" folders are merged (row-wise, 'train' following 'test') into a single "test_train" folder. The new files have the "_test_train.csv" suffix appended to them. Data from the "Inertial Signals" subfolder has also been merged.

# 2. Re-reading

In this section of the script the relevant ".csv" files are read back into the following R environment variables:

X               : a 561-column data frame representing the collected features (floating point values)
features        : a two-column data frame containing the names of the features described in X (strings)
subject         : a two-column data frame of indices representing the subjects involved in the experiment [each subject has an integer ID ranging from 1 to 30]
y               : a two-column data frame of indices representing the type of activity performed [integers from 1 to 6]
activity_labels : a two-column data frame representing a lookup table, which contains the names of the activities corresponding to the indices in 'y' (strings such as 'SITTING' or 'WALKING')

# 3. Extracted variables on the mean and standard deviation for each feature measurement

In this section:
- a subset of X is created which retains only the columns which contain 'mean' or 'std' within their names (81 features)
- a column of subject indices () is added as the first column in the data frame and is given the name 'personindex'
- a column of activity indices (y) is added as the second column in the data frame, then
* the activities indices are replaced with the strings contained  in the 'activity-labels' lookup table
* the column is given the name 'activityname'
- the names of all columns are converted to lower case and stripped of all but alphanumeric characters

The final tidied dataset (1) can be found within the 'master_frame' environment variable

# 4. Averages of each feature measurement by activity and each subject

In this section, the tidy data set from 3 is:
- subset and grouped by person index (removing the activity name column) and the mean averages of all features are calculated for each person. Feature columns are appended with '-avg' in their names.
- subset and grouped by activity name (removing the person index column) and the mean averages of all features are calculated for each activity. Feature columns are appended with '-avg' in their names.

The final tidied dataset (2) can be found within the 'subject_averages' and 'activity_averages' environment variables

# Further Information

For more granular detail see the ['run_analysis.R'] script itself and the commented code contained therein.
