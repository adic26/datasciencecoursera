


mythird_plot <- function()
{
  baltimoreData <- NEI[ NEI$fips=="24510", ]
  collapsed <- ddply(baltimoreData,.(year,type),numcolwise(sum))
  
  library(ggplot2)
  
  qplot( year, Emissions, data=collapsed, color=collapsed$type, geom = c("point", "smooth") )
  
  
  
  
}


