plot5 <- function()
{
  
  #reading the data from rds file
  SCC <- readRDS("Source_Classification_Code.rds")
  NEI <- readRDS("summarySCC_PM25.rds")
  
  #subsetting data
  highway_vehicles <- SCC[grepl("Veh",SCC$Short.Name,ignore.case=TRUE),] #finding only combustion data
  
  #finding a subset
  library(plyr)
  baltimoreData <- NEI[ NEI$fips=="24510", ]
  
  #merge from NEI where NEI$SCC are inside highway vehicles
  correlated <- baltimoreData[baltimoreData$SCC %in% highway_vehicles$SCC,]
  
  #subsetting by group type and year
  baltimore <- ddply(correlated,.(type,year),numcolwise(sum))
  baltimore <- baltimore[baltimore$type=="ON-ROAD",] #conforming to only on-road
  
  library(ggplot2)
  qplot( year, Emissions, data=baltimore,main="Baltimore City Motor Vehicle Emission", colour=type,geom = c("point", "smooth") ) 
  
  
}