corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  files_full <- list.files(directory,full.names=TRUE)
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  get_obs <- complete(directory)
  
  ## Return a numeric vector of correlations
  retVector <- c()
  hit <- which(get_obs[,"nobs"]>threshold)
  for(i in hit) {
    this_set <- read.csv(files_full[i])
    cjobs <- complete.cases(this_set)
    compjobs <- this_set[cjobs,]
    retVector <- rbind(retVector,cor(compjobs$sulfate,compjobs$nitrate,use="na.or.complete"))
  }
  retVector
}