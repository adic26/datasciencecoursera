complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
#   print(directory,quote=TRUE)
#   print(id,quote=TRUE)
#   print(typeof(id),quote=TRUE)
  files_full <- list.files(directory,full.names=TRUE)
  retData <- data.frame()
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases 
  for(i in id)
  {
      this_set <- read.csv(files_full[i])
      good <- complete.cases(this_set)
      compjobs <- this_set[good,]
      retData <- rbind(retData,c(i,nrow(compjobs))) 
  }
    colnames(retData) <- c("id","nobs")
    retData
  
}
