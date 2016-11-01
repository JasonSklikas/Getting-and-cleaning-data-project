# Getting-and-cleaning-data-project

This is the final course project for getting and cleaning data on Coursera. The run.analysis.R does the following :
First it downloads the zip file and unzip it
Then it loads the data into R.
Then takes only the mean and the standar deviation measurement
After it combines the data with the mean and standar deviations and now you have a table with 79 columns and 10299 rows.
Then it tidys up the column names
Then it add two more variables subject and activity.
It creates a txt clean_data where it has 81 variables and 10299 obs. only with mean and std.
Finaly it creates another txt tidy_data_averages that containts the mean for every activity ordered by subject
