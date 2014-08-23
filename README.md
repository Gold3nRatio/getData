---
title: "README"
date: "08/23/2014"
output: html_document
---

This R Markdown document explains the process to clean up the data used in the Data Science Getting and Cleaning Data class.  The original data set is from UCI's Machine Learning Repository and could be obtained from:

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The process takes the data files from the data folder and extract only the mean and standard deviation from each variable.  After the clean data is created, the process then takes the clean data to generate another data set containing the average of each variable by subject and activity.

## Files ##

The dataset includes the following files:  
- 'README.md'  
- 'run_analysis.R': file to clean the UCI data  
- 'tidyData.txt': tidy data contain mean and standard deviation of variables  
- 'tidyAvg.txt': tidy data contain average of each variable  
- 'codebook.txt': descriptions of the text files  
- 'UCI HAR Dataset': contain data for Human Activity Recognition

## Cleaninng Process ##
The cleaning process is performed by the file 'run_analysis.R' and is very straightforward. Steps are as followed:  
1. Reads in the activity label and features label from the data folder.  The variables are stored for later use.  
2. The process creates 6 variables to read files from both the test and train dataset, where each dataset contain the subject who perform each activity, the activity name and the actual measurements generated from raw data. Note, data from the sub folders in the test and train folders are not used.  
3. Features are assigned to the column names of the measurement dataset.  
4. The process then look for columns with names like 'mean()' or 'std()', these columns are tracked and assigned to a new data frame for test and train.  
5. The measurement files are combined with subject and activity labels.  
6. The new measurement data is then combined together between the test and train data.  
7. Using the activity labels from step 1, the newly created data frame is merged to show the actual description of the activity.  
8. The new tidy data is then write as a text file into the directory.  
9. A new set of data is created to find the average of each variable for each subject and activity.  The data is then write to another text file.  

This concludes the processing of the files.

### Citation ###
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012