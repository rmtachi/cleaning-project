# UCI Human Activity Recognition Dataset

## Dataset Information

The original dataset is stored on the UCI machine learning repository ([here]), and the source is from Universit&#224 degli Studi di Genova. The data records the 3-dimensional acceleration and 3-dimensional angular acceleration for 30 subjects performing six activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING). Each activity was sampled at 50Hz, with duration ranging between approximately 25 and 40 seconds. The data was then processed in a number of steps, summarized below:

1. Pre-processed for noise and captured in 2.56s (128 readings at 50 Hz) sliding windows.
2. Run through a series of filters and transforms to produce 33 primary variables.
3. A number of statistics were computed on each variable, creating a total of 516 variables for each window (refered to as the feature vector). 
4. ** Each variable was normalized to the range [-1,1] across all feature vectors.** Therefore, the feature vectors are **unitless**.
5. Subjects were randomly partitioned into a training set with 21 subjects and test set with 9 subjects

A full description of the data can be found on the site linked to above and corresponding `README.txt` and `features_info.txt` file in the dataset.

## Data merging and summary

The relevant data was received in a number of files:
* feature vectors for training set
* feature vectors for test set
* vector identifying subject for each training set feature vector
* vector identifying subject for each test set feature vector
* vector identifying activity for each training set feature vector
* vector identifying activity for each test set feature vector
* names of feature vector variables
* names of activities

For this project 2 of the 516 variables were of interest - the mean and standard deviation for each window. These variables were extracted and the test and training set variables were concatenated. Columns for subject, activity and set (training or test) were added.

Finally a reduced dataset was created, averaging variables across windows corresponding to each unique subject-activity combination, resulting in a dataset with 180 rows (30 subjects times 6 activities). Note that this renders the dataset mostly useless, because each subject performed each activity more than once, therefore this averages across distinct time series.

## Dataset variable details

The dataset `HAR_summary.txt` is located in the `data` folder. It contains 69 variables. The first three variables are:

1. subject: integers from 1 to 30 corresponding to each test subject
2. activity: a string in the set "walk", "up", "down", "sit", "stand", "lay". "up" and "down" are walking up and down stairs, respectively.
3. set: the integers 1 or 2, coressponding to training and test set, respectively.

The remaining 66 variables are explained by their names as follows:
+ [t|f].[Body|Gravity][Acc|Gyro][|Jerk].[Mag|X|Y|Z].[mean|std]
+ [t|f] : either time or frequency domain. The frequency domain variables were computed using a Fast Fourier Transform.
+ [Body|Gravity] : The body or gravity component of acceleration.
+ [Acc|Gyro] : Acceleration or angular velocity.
+ [|Jerk] : The derivative of [Acc|Gyro] (rate of change of acceleration or angular velocity).
+ [Mag|X|Y|Z] : Either the magnitude of the variable or corresponding axis.
+ [mean|std] : mean or standard deviation over the window


[here]: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
[//]: # (December 18, 2014

