Getting and Cleaning Data project
===================

This file describes the variables, the data, and transformations I've done to data.

## The data
Here are short descriptions of the data set files

* _features.txt_ - column names of the data set
* _X_test.txt_ & _X_train.txt_ - measurement values
* _y_test.txt_ & _y_train.txt_ - measured activities
* _subject_test.txt_ & _subject_train.txt_ - measurement subjects

The data is from UCI Machine Learning Repository:

* http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
* https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Variables and transformation:

File paths

* `features.txt`, `subject_test.txt`, `X_test.txt`, `y_test.txt`, `subject_train.txt`, `X_train.txt`, `y_train.txt`

Features & selected features

* `features.data`, `features.selected`
* selected features are a subset of measures that have with mean() or std() in their name

Train data

* `subject_train.data`, `X_train.data`, `y_train.data`

Selected and combined train data

* `X_train.selected`, `train`
* combined with cbind

Test data

* `subject_test.data`, `X_test.data`, `y_test.data`

Selected and combined test data

* `X_test.selected`, `test`
* combined with cbind

Names for activities

* `labelNames`
* activity codes are replaces following way
   1 -> Walking
   2 -> Walking upstairs
   3 -> Walking downstairs
   4 -> Sitting
   5 -> Standing
   6 -> Laying

Combined and grouped data

* `data`, `tidyData`
* combined with rbind
* grouping with aggregate-function
* grouped by activity and subject columns 

## Measures:

XYZ values, means and standard deviantions for these measures

* tBodyAcc
* tGravityAcc
* tBodyAccJerk
* tBodyGyro
* tBodyGyroJerk
* fBodyAcc
* fBodyAccJerk
* fBodyGyro

Means and stardard deviatinos for these

* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag
