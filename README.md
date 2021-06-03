# Introduction

The purpose of this repo is to merge and tidy data during the "Human Activity Recognition Using Smartphones" project, found in

, producing two new datasets, as follows:

- tidy dataset 1: extracted measurements regarding mean and standard deviations
- tidy dataset 2: averages of the measurements by activity name and subject ID

Please note, for reasons of size the original dataset is not included in this repo. Full details on the original dataset can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Installation

Installation should proceed as follows:

1. Create a top level folder e.g. "GettingAndCleaningData"
2. Download the dataset into this folder from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). The folder should be entitled "UCI HAR Dataset"
3. Clone this repo also to this folder i.e. `git clone https://github.com/sidechained/GettingAndCleaningData-CourseProject.git`
4. Enter the "GettingAndCleaningData-CourseProject" folder and run the "run_analysis.R" file i.e. using `r shell`, then `source("run_analysis.R")`

# Tidied Datasets

The resulting datasets described above can then be found as environment variables within R (they are not rewritten as files), as follows:

- tidy dataset 1 is found within the 'master_frame' environment variable
- tidy dataset 2 is found within the 'subject_averages' and 'activity_averages' environment variables
