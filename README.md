# getting_cleaning_data
This repo contains the R scripts that can be used to analysis the UCI HAR Dataset and convert it into a tidy data set.

<h5>Requirements</h5>

<p>Create a R script that does the following</p>
<ul>
    <li>Merges the training and the test sets to create one data set.
    <li>Extracts only the measurements on the mean and standard deviation for each measurement.
    <li>Uses descriptive activity names to name the activities in the data set
    <li>Appropriately labels the data set with descriptive variable names.
    <li>From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
</ul>
<h5>R code </h5>

The R code that is used for analysis is available in the run_analysis.R file.

Source the file in R using the following command and it will automatically download the dataset, perform the transformation, tidy the data and save it in the file tidy_data.txt.

<i>source("run_analysis.R")</i>

The tidy data set can be loaded back into R using the following command

<i>tidy_data <- read.table("tidy_data.txt")</i>

<h5>Data CodeBook </h5>

The codebook available in this repo describes the variables, the data, the transformations that are done and the clean up that was performed on the data.
