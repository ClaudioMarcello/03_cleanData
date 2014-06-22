Code book

Purpose: This code book describes the variables, data and transformations
	or work performed to clean up the data

*** Source data ****

The source data is available in following link

    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


After downloading and unziping this file, the source data is in following folders

UCI HAR Dataset			<- this is the working directory

    |
    |-train			<- train data folder
    |   |-X_train.txt		<- table of 7352 observations of 561 variables
    |  	|			data are measurements of the variables
    |   |-y_train.txt		<- table of 7352 observations of 1 variable
    | 	|			data are code number of activity performed
    | 	|-subject_train.txt	<- table of 7352 observations of 1 variable
    |   |			data are number of subject who performed the activity
    |
    |-test			<- test data folder
    |    |-X_test.txt		<- table of 2947 observations of 561 variables
    |   |			data are measurements of the variables
    |   |-y_test.txt		<- table of 2947 observations of 1 variable
    |  	|			data are code number of activity performed
    |  	|-subject_test.txt	<- table of 2947 observations of 1 variable
    |  	|			data are number of subject who performed the activity
    |   |
    |-features_info.txt		<- table of 561 observations of 1 variable
    |				data are the names of the measurements tabulated in the X_ files
    |				the project ask for extracting those measurements whose name
    |				includes "mean()" or "sdev()"
    |-activity_labels.txt	<- table of 6 observations of 1 variable
    |				data are the activity names
    |				the project ask for remplacing activity code for the activity name


*** Procedure to clean up the data ***

1. Merge the training and the test sets (X_ files) to create one data set
	The result is a measurements set of 10299 observations of 561 variables


2. Appropriately label the data set with descriptive variable names. 
	Use the features_info.txt file to name the 561 variables of the measurements set



3. Extract only the measurements on the mean and standard deviation for each measurement

	3.1 Use the features table to generate a boolean vector indicating 

		those variable names containing "mean()" or "std()"

	3.2 Use above boolean vector to filter from measurements set the summarizing data

		This is the new measurements set 

		(10299 observations of 66 variables)

 

4. Merge subject number with measurement table

 	4.1 Merge the training subject set and the test subject set (the subject_ files)

		(10299 observations of 1 variable)

	4.2 Combine the resulting column with the measurements set

  Use descriptive activity names to name the activities in the data set

	4.3 Merge the training activity set and the test activity set (the y_ files)

		(10299 observations of 1 variable)

	4.4 Use the activity names given in activity_labels.txt file

	     to map the activity code into activity name

	4.5 Combine the resulting column with the measurements set

		(10299 observations of 68 variables)



5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 

	5.1 Melt the measurements set keeping subject and activity;

		measurement name and measurement value go into two new columns

		(679734 observations of 4 variables)

	5.2 Cast the molten data set with subject and activity in the vertical direction

		and measurement name and *** the average of measurement value *** in the horizontal direction

		(180 observations of 68 variables)



6.  Write tidy data set to tab separated text file


