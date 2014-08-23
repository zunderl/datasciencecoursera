## Import data table package
## Assumes all files are in the current directory
## reads all the training and test data
## merges them
## Takes only the mean and standard deviation column using grep and creates a subset of the dataset
## Assigns the column names from the feature set to the above data set
## Appends the subject id and activity label columns to the table
## Casts the data frame into a data table for Aggregation
## Aggegration is done on the columns grouped by subject id and activity states
## Aggregate Result is written back into the file
## Result containts 180 rows detailing each average of each subject activity
