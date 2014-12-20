# UCI Human Activity Recognition Data Set

## Data Set Information

The data set is stored on the UCI machine learning repository ([here]), and the soure is from Universit&#224 degli Studi di Genova. The data records the 3-dimensional acceleration and 3-dimensional angular acceleration for thirty subjects performing six activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING). Each movements were sampled at 50Hz, with duration ranging between approximately 5 to 10 seconds. The data was then processed in a number of steps, summarized below:
1. The data was pre-processed for noise and captured in 2.56s (128 readings at 50 Hz) sliding windows with 
through a series of filters and transforms to produce eighteen primary variables. A number of summary and other functions were then applied to these, to produce in total 561 features for each 

A full description of the data can be found on the site linked to above and corresponding README.txt file.


The data set `har_summ.txt` is a 



The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

Check the README.txt file for further details about this dataset.


Attribute Information:

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


[here]: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
[//]: # (December 18, 2014
