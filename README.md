CleanData
=========

Getting and Cleaning Data
Course Project

Procedure to clean up the data file.

1. Download the data for the project: 

    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

2. Unzip the downloaded zip file

    The files are in a folder named UCI HAR Dataset.

    Make this folder the working directory

3. Copy the run_analysis.R script file to the working directory

4. Run the script

The script run_analysis.R script procedure is as follows:

1. Read and merge the training and the test sets (X_ sets) to create one measurement set.

2. Read variable names from features.txt file and assign them to the variables of the measurement set.

3. Extract those variables whose name include mean() or std().

4. Add subject and activity columns:

    4.1 Read and merge the training and the test sets (subject_ sets) to create one subject set.

    4.2 Reads and merges the training and the test sets (y_ sets) to create one activity set.

    4.3 Transform the coded activity to appropriate label using labels given in activity_label.txt file.

    4.4 Affix subject and activity columns to measurement set.

5. Create a tidy measurement set with each combination of subject, activity and the average of measurement variable:
    5.1 Melt the measurement set keeping subject, activity, variable name and measurement.
    5.2 Cast the molten set averaging the measurements by combination of subject, activity and variable.
6.  Export the tidy measuremet set to a tab separated text file.
