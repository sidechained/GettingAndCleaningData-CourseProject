# Introduction

The purpose of this repo is to merge and tidy the data collected during the "Human Activity Recognition Using Smartphones" project. The script produces two sets of files, as follows:

- a merged version of the original test and train datasets (in the "UCI HAR Dataset Merged" folder)
- a .txt file of tidy data containing averages of extracted measurements regarding mean and standard deviations, grouped by activity name and subject ID ("UCI-HAR_tidyData.txt").

Please note, for reasons of size the original dataset is not included in this repo. Full details about the original dataset can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Installation

Installation should proceed as follows:

1. Clone this repo with `git clone https://github.com/sidechained/GettingAndCleaningData-CourseProject.git`
2. Navigate into the "GettingAndCleaningData-CourseProject" folder, then download the original dataset into it from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). Unzip this file in place. Within the "GettingAndCleaningData-CourseProject" repo folder you should now have a folder called "UCI HAR Dataset".
3. Now run the "run_analysis.R" file in one of two ways:
- using `r shell`, then `source("run_analysis.R")`
- in RStudio, ensuring the working directory is set to the "GettingAndCleaningData-CourseProject" repo folder (using setwd).

# Further Information

For more details of the tidying and analysis procedure please see the [codebook](CodeBook.md)
