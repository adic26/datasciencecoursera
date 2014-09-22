funplot <- function()
{
  
  library(ggplot2)
  
  #So we have data with this columns:
  # 
  #subject  mean1   mean2   mean3
  #1        0.23    0.45    0.89
  #2        0.45    0.34    0.98
  #3        0.34    0.12    0.34
  #
  #When this gets melted:
  #this melts all the columns but grouped by "id.vars"
  meltedData <- melt(walkingwithoutactivity,id.vars="subject")
  
  #result:
  ##subject  variable   value  
  #1        mean1       0.23  
  #2        mean1       0.45
  #3        mean1       0.34
  #1        mean2       0.45
  #2        mean2       0.34
  #3        mean2       0.12
  #1        mean3       0.89
  #2        mean3       0.98
  #3        mean3       0.34
  
  #this would plot melted data , x = value, y = variable, group by 'subject'
  sp <- ggplot(meltedData,aes(value,variable,colour=subject)) + geom_point(size=1)
  sp
}