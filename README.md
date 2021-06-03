# Introduction

The purpose of this repo is to merge and tidy data during the "Human Activity Recognition Using Smartphones" project to produce two new datasets, as follows:

- tidy dataset 1: extracted measurements regarding mean and standard deviations
- tidy dataset 2: averages of the measurements in dataset 1, grouped by activity name and subject ID

Please note, for reasons of size the original dataset is not included in this repo. Full details about the original dataset can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Installation

Installation should proceed as follows:

1. Create a top level folder on your system e.g. "GettingAndCleaningData" and navigate into it
2. Download the starting dataset from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and unzip it. The resulting folder should be entitled "UCI HAR Dataset"
3. Clone this repo also to this folder i.e. `git clone https://github.com/sidechained/GettingAndCleaningData-CourseProject.git`
4. Navigate into the "GettingAndCleaningData-CourseProject" folder and run the "run_analysis.R" file i.e. using `r shell`, then `source("run_analysis.R")`

# Tidied Datasets

The resulting datasets described above can then be found as environment variables within R (they are not rewritten as files), as follows:

- tidy dataset 1 is found within the 'master_frame' environment variable and contains extracted feature measurements relating to mean and standard deviations
- tidy dataset 2 is found within the 'subject_averages' and 'activity_averages' environment variables, which contain averages of the measurements from dataset 1, organised respectively by activity name and subject ID

# Further Information

For more details of the tidying and analysis procedure please see the [codebook](CodeBook.md)
