# 1.Summary



# 2.Original dataset

Download "UCI HAR Dataset" from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

Use datasets below

    activity_labels.txt
    features.txt
    subject_test.txt (_test files are in the 'test' folder in the original .zip file)
    X_test.txt
    y_test.txt
    subject_train.txt (_train files are in the 'train' folder in the original .zip file)
    X_train.txt
    y_train.txt


*The dataset includes the following files:*

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 




# 3.Output

The data set all_gather.txt is tidy dataset that combains test and train datasets.

The data set all_gather.txt contains the following variables:
  
- "subject" identifies the subject who performed the activity
- "num"  define activity like 1 WALKING, 2 WALKING_UPSTAIRS, 3 WALKING_DOWNSTAIRS, 4 SITTING, 5 STANDING, 6 LAYING         
- "activity"    difeine activity name
- "features2"  selected variables its contains "mean" or "std"
- "value"  value of masurements


The data set all_summary.txt contains the average of each variable for each activity and each subject
The data set all_summary.txt contains the following variables:
  
-"subject" identifies the subject who performed the activity
-"num"  define activity like 1 WALKING, 2 WALKING_UPSTAIRS, 3 WALKING_DOWNSTAIRS, 4 SITTING, 5 STANDING, 6 LAYING         
-"activity"    difeine activity name       
-"features2"  selected variables its contains "mean" or "std"
-"avg_value"  average value of masurements


# 2.Original dataset

Download "UCI HAR Dataset" from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

    activity_labels.txt
    features.txt
    subject_test.txt (_test files are in the 'test' folder in the original .zip file)
    X_test.txt
    y_test.txt
    subject_train.txt (_train files are in the 'train' folder in the original .zip file)
    X_train.txt
    y_train.txt


*The dataset includes the following files:*


# 4.Data transformation

My output is all_gather.txt and all_summary.txt





# 5.
