Note for Coursera Evaluator: I took the view that this README should not just be supplemental info relating to the Coursera 

assignment, but also suffice as a README for the underlying input data as well. As a result, much of what below overlaps with 

the README and features_info.txt of the underlying data set. For purposes of evaluation, I direct you to the second part of the 

'Input Data' section, the 'Output Data' section, and first part of 'CodeBook.md'. Happy Grading!



Purpose of Script
================
To merge, tidy, and summarize the input data. The script is in the file 'run_analysis.R'
12/21/2014



Input Data
===========
This data is from the recordings of 30 subjects performing the activities of daily life while wearing a waist-mounted smartphone 

with embedded inertial sensors.  

This data was obtained from the UCI Machine Learning Repository, and a complete description on the underlying data set can be 

obtained at: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is 

from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard 

gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 

'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total 

acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. 

The units are radians/second. 


Output Data
===========
'data_merged.txt': the complete, tidied data set recorded in the study. Each row is a unique observation of a particular 

combination of Subject and Activity_Label(described below). 

'data_all_mean_and_std_columns.txt': columns extracted from data_merged.txt that measured the mean or standard deviation of each 

variable for each time window.

'data_means.txt': the average of each numeric variable in 'data_all_mean_and_std.txt'for each unique combination of Subject and 

Activity_Label. Variables are the same as given in CodeBook.md, only prefixed with "Mean."

'train/data_train.txt': the tidied data for only the Subjects in the 'train' Experimental_Group (described in CodeBook.md).

'test/data_test.txt': the tidied data for only the Subjects in the 'test' Experimental_Group (described in CodeBook.md).



