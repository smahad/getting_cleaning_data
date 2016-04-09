### Introduction

This CodeBook describes the data contained in the output of the run_analysis.R script contained in this repository. The tidy flat text file can be read using data.table to create a data table for further analysis.

tidyData <- data.table("tidyData.txt")

The script creates a tidy, condensed version of the University of California Irvine's (UCI's) dataset for Human Activity Recognition (HAR) using smartphones that can be used for further research and analysis. The original UCI HAR Dataset is a public domain dataset built from the recordings of subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensor (see http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

As noted in the above referenced document, the original data comes from experiments that were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (walking, walking_upstairs, walking_downstairs, sitting, standing, and laying) wearing a Samsung Galaxy S II smartphone on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz. The experiments were video-recorded to label the data manually.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force was assumed to have only low frequency components, so a filter with a 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The script generates a combined subset of the original data by extracting the mean and standard deviation features for each of the 33 processed signals, for a total of 66 features (out of the 561 available features from the original feature vector). This combined subset contains 10299 observations of 68 variables, with activity and subject appended to the 66 features.

The combined subset is further reduced by calculating the mean of the observations by activities and subject pair to generate 180 observations (6 activities * 30 subjects) of the same 68 variables. This dataset is tidied to generate a narrow and lean dataset containing 11880 observations with 4 variables each and is saved as a text file in the current working directory with the name tidyData.txt

### Description of the UCI HAR variables
The Tidy dataset consists of 180 observations summarized by activity (6 categories) and subject (30 volunteers) pairs.

##subject

Participants who carried out the experiment.(30 participants)

##activity
The activity name with the following possible values.

    'laying',
    'sitting',
    'standing',
    'walking',
    'walking_downstairs'
    'walking_upstairs

##measurement
The name of the measurement for which the mean is calculated. This variable can contain one of the following 66 variables. Please refer the codebook with the original dataset for the explanation of these different variables.

 1 "activity"                                       
 2 "body-acceleration-jerk-magnitude-mean-frequency"
 3 "body-acceleration-jerk-magnitude-mean-time"     
 4 "body-acceleration-jerk-magnitude-std-frequency" 
 5 "body-acceleration-jerk-magnitude-std-time"      
 6 "body-acceleration-jerk-mean-x-frequency"        
 7 "body-acceleration-jerk-mean-x-time"             
 8 "body-acceleration-jerk-mean-y-frequency"        
 9 "body-acceleration-jerk-mean-y-time"             
10 "body-acceleration-jerk-mean-z-frequency"        
11 "body-acceleration-jerk-mean-z-time"             
12 "body-acceleration-jerk-std-x-frequency"         
13 "body-acceleration-jerk-std-x-time"              
14 "body-acceleration-jerk-std-y-frequency"         
15 "body-acceleration-jerk-std-y-time"              
16 "body-acceleration-jerk-std-z-frequency"         
17 "body-acceleration-jerk-std-z-time"              
18 "body-acceleration-magnitude-mean-frequency"     
19 "body-acceleration-magnitude-mean-time"          
20 "body-acceleration-magnitude-std-frequency"      
21 "body-acceleration-magnitude-std-time"           
22 "body-acceleration-mean-x-frequency"             
23 "body-acceleration-mean-x-time"                  
24 "body-acceleration-mean-y-frequency"             
25 "body-acceleration-mean-y-time"                  
26 "body-acceleration-mean-z-frequency"             
27 "body-acceleration-mean-z-time"                  
28 "body-acceleration-std-x-frequency"              
29 "body-acceleration-std-x-time"                   
30 "body-acceleration-std-y-frequency"              
31 "body-acceleration-std-y-time"                   
32 "body-acceleration-std-z-frequency"              
33 "body-acceleration-std-z-time"                   
34 "body-gyro-jerk-magnitude-mean-frequency"        
35 "body-gyro-jerk-magnitude-mean-time"             
36 "body-gyro-jerk-magnitude-std-frequency"         
37 "body-gyro-jerk-magnitude-std-time"              
38 "body-gyro-jerk-mean-x-time"                     
39 "body-gyro-jerk-mean-y-time"                     
40 "body-gyro-jerk-mean-z-time"                     
41 "body-gyro-jerk-std-x-time"                      
42 "body-gyro-jerk-std-y-time"                      
43 "body-gyro-jerk-std-z-time"                      
44 "body-gyro-magnitude-mean-frequency"             
45 "body-gyro-magnitude-mean-time"                  
46 "body-gyro-magnitude-std-frequency"              
47 "body-gyro-magnitude-std-time"                   
48 "body-gyro-mean-x-frequency"                     
49 "body-gyro-mean-x-time"                          
50 "body-gyro-mean-y-frequency"                     
51 "body-gyro-mean-y-time"                          
52 "body-gyro-mean-z-frequency"                     
53 "body-gyro-mean-z-time"                          
54 "body-gyro-std-x-frequency"                      
55 "body-gyro-std-x-time"                           
56 "body-gyro-std-y-frequency"                      
57 "body-gyro-std-y-time"                           
58 "body-gyro-std-z-frequency"                      
59 "body-gyro-std-z-time"                           
60 "gravity-acceleration-magnitude-mean-time"       
61 "gravity-acceleration-magnitude-std-time"        
62 "gravity-acceleration-mean-x-time"               
63 "gravity-acceleration-mean-y-time"               
64 "gravity-acceleration-mean-z-time"               
65 "gravity-acceleration-std-x-time"                
66 "gravity-acceleration-std-y-time"                
67 "gravity-acceleration-std-z-time"                
68 "subject" 

##mean
The mean of measurements.