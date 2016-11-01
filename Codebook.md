#Code Book
This code book explains the values in Clean_Data.txt and tidy_data_average.txt
##Identifiers
* `.Subject = Who performed the activity for each window sample. Its range is from 1 to 30.` 
* `Activity = We have 6 activities 1.standing 2.sitting 3.laying 4.walking  5.walking downstairs 6.walking upstairs`

##Measurements
When i loaded x_txt files we have 561 variables after extracting only the means and std we have 79 variables. Also i changed the column names so they variables are more descriptive.
*`"t"="time"
*"f"="frequency"
*"acc"="accelerometer"
*"gyro"="gyroscope"
*"bodybody","body"
*"mag"="magnitude" `

## Activities
The activities where the y_txt files,they had only 1-6  values so i created the ydata variable that has the activities as characters.
* `WALKING (value 1): subject was walking during the test
* `WALKING_UPSTAIRS (value 2): subject was walking up a staircase during the test
* `WALKING_DOWNSTAIRS (value 3): subject was walking down a staircase during the test
* `SITTING (value 4): subject was sitting during the test
* `STANDING (value 5): subject was standing during the test`
* `LAYING (value 6): subject was laying down during the test`
