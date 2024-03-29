# Introduction

This file describes the tidying and analysis procedure performed by ['run_analysis.R'](run_analysis.R), which can be summarised as follows:

# 1. Merging and writing

This section:
- Creates a new dataset folder called "UCI HAR Dataset Merged" in the top level folder, based on the original "UCI HAR Dataset"
- Reads in the original '.txt' files, merges them (when required) and writes them out as '.csv' files into the new dataset folder
- The original "test" and "train" folders are merged (row-wise, 'train' following 'test') into a single "test_train" folder. The new files have the "_test_train.csv" suffix appended to them. Data from the "Inertial Signals" subfolder has also been merged.
- __NOTE__: At the top level of "UCI HAR Dataset" only the "features.txt" and "activity_labels.txt" file are bought over to the new dataset (with no merging required). If you need further documentation on these files, please refer to the extra files in the original dataset.

# 2. Re-reading

In this section of the script, the relevant ".csv" files are read back into the following R environment variables:

- _X_               : a 561-column data frame representing the collected features (floating point values)
- _features_        : a two-column data frame containing the names of the features described in X (strings)
- _subject_         : a two-column data frame of indices representing the subjects involved in the experiment [each subject has an integer ID ranging from 1 to 30]
- _y_               : a two-column data frame of indices representing the type of activity performed [integers from 1 to 6]
- _activity_labels_ : a two-column data frame representing a lookup table, which contains the names of the activities corresponding to the indices in 'y' (strings such as 'SITTING' or 'WALKING')

# 3. Extraction of only mean and standard deviation features

In this section:
- a subset of X is created which retains only the columns that contain 'mean' or 'std' within their names (81 features)
- a column of subject indices (subject) is added as the first column in the data frame and is given the name 'personindex'
- a column of activity indices (y) is added as the second column in the data frame, then:
    - the activities indices are replaced with the strings contained in the 'activity-labels' lookup table
    - the column is given the name 'activityname'
- the names of all columns are converted to lower case and stripped of all but alphanumeric characters (as per r convention)

This dataset is not written to a file, but can be found within the 'master_frame' environment variable

# 4. Calculation of averages for each feature measurement (grouped by activity name and person index)

In this section, the tidy data set from part 3 is subset and grouped by person index and activity name, before calculating the mean averages for all features. In addition, all feature columns in both new data frame are appended with '-avg' in their names. The final tidied dataset is written to the file "UCI-HAR_tidyData.txt" in the root repo directory.

# Further Information

For more granular detail see the ['run_analysis.R'](run_analysis.R) script itself and the commented code contained therein.
