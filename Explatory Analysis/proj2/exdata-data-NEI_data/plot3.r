plot3 <- function()
{
  #reading the data from rds file
  NEI <- readRDS("summarySCC_PM25.rds")
  
  #subset of baltimore data collapsed to summation of total Emissions grouped by Year and Type
  library(plyr)
  baltimoreData <- NEI[ NEI$fips=="24510", ]
  collapsed <- ddply(baltimoreData,.(year,type),numcolwise(sum))
  
  #ggplot
  library(ggplot2)
  qplot( year, Emissions, data=collapsed,main="Baltimore City Emissions", colour=type,geom = c("point", "smooth") ) 
}


