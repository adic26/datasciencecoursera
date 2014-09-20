run_analysis <- function()
{
  #prepare paths ------------
  
  labels_file     <- "./activity_labels.txt"
  features_file   <- "./features.txt"
  train_subj_file <- "./train/subject_train.txt"
  train_x_file    <- "./train/x_train.txt"
  train_y_file    <- "./train/y_train.txt"
  test_subj_file  <- "./test/subject_test.txt"
  test_x_file     <- "./test/x_test.txt"
  test_y_file     <- "./test/y_test.txt"
 
  #Load Data files ------
  activities <- read.table( labels_file, header=FALSE, sep=" ", col.names=c("id", "activity") )   
  features <- read.table( features_file, header=FALSE, sep=" ", col.names=c("id","feature") )
  
  subject_train <- read.table( train_subj_file, header=FALSE, col.names="subject" )
  subject_test  <- read.table( test_subj_file, header=FALSE, col.names="subject" )
  
  x_train <- read.table( train_x_file, header = FALSE, col.names = features$feature )
  y_train <- read.table( train_y_file, header = FALSE, col.names = "activity" )
  
  x_test  <- read.table( test_x_file, header = FALSE, col.names = features$feature )
  y_test  <- read.table( test_y_file, header = FALSE, col.names = "activity" )
  
  #Merge the two datasets -------
  subject_data <- rbind( subject_train, subject_test)
  x_data <- rbind( x_train, x_test )
  y_data <- rbind( y_train, y_test )
  
  ## Remove unwanted data and change column names -------------------------
  
  ## Cleanup X data
  mean_std_columns <- grep( "mean|std", features$feature )
  x_data <- x_data[ ,mean_std_columns]
  colnames( x_data ) = features$feature[ mean_std_columns ]
  
  ## Cleanup Y data
  ## TODO: Find a better way to do this, vectorized
  ##       Trying to read it from the activities table failed
  y_data$activity[ y_data$activity == "1" ] = "WALKING"
  y_data$activity[ y_data$activity == "2" ] = "WALKING_UPSTAIRS"
  y_data$activity[ y_data$activity == "3" ] = "WALKING_DOWNSTAIRS"
  y_data$activity[ y_data$activity == "4" ] = "SITTING"
  y_data$activity[ y_data$activity == "5" ] = "STANDING"
  y_data$activity[ y_data$activity == "6" ] = "LAYING"
  
  ## Merge data and sort ----------------------------------------------
  
  clean_data <- cbind( subject_data, y_data, x_data )
  
  ## From the dataset in step 4, create a second, independent tiny
  ## data set with the average of each variable for each activity
  ## and each subject
  library(plyr)
  subset <- ddply(clean_data, .(subject, activity), numcolwise(mean))
  
  
  
  
}
