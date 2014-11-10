## Getting and cleaning data
For creating a tidy data set of wearable computing data originally from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Files in this repo

README.md -- you are reading it right now
CodeBook.md -- codebook describing variables, the data and transformations
run_analysis.R -- actual R code


The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

It should run in a folder of the Samsung data (the zip had this folder: UCI HAR Dataset) The script assumes it has in it's working directory the following files and folders:

activity_labels.txt
features.txt
test/
train/
The output is created in working directory with the name of tidydata.txt

run_analysis.R walkthrough

It follows the goals step by step.

Step 1:
Merges the training and the test sets to create one data set.

Step 2:
Extracts only the measurements on the mean and standard deviation for each measurement. 

Step 3:
Uses descriptive activity names to name the activities in the data set.

Step 4:
Appropriately labels the data set with descriptive variable names. 

Step 5:
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


Write the new tidy set into a text file called tidydata.txt, formatted similarly to the original files.