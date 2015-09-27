# clean-data_cprj
Coursera Getting and Cleaning Data Course Project

The script "run_analysis.R" processes all 5 steps required by the course project.

"run_analysis.R" first unzips the "getdata_projectfiles_UCI HAR Dataset.zip" file.

The train and test .txt files are read, but the "Inertial Signals" files are not read, as they are not required.

The last step of "run_analysis.R" writes the tidy data frame "hardata02" to the file "tidy_data.txt".
