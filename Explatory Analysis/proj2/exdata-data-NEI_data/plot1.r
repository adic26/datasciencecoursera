plot1 <- function()
{
  #reading the data from rds file
  NEI <- readRDS("summarySCC_PM25.rds")
  
  #setting up subdata to get sum of Emissions groups by Type and Year
  library(plyr)
  allFips <- ddply(NEI,.(type,year),numcolwise(sum))
  
  #Base plotting Skeleton
  plot( x = allFips$year, y = allFips$Emissions,
        xlab = "Year",
        ylab = "Emissions",
        type = "n"
        )
  title("Emissions for All Types")
  
  #setting up each line per type
  nonRoad <- allFips[ allFips$type == "NON-ROAD", ]
  nonpoint <- allFips[ allFips$type == "NONPOINT", ]
  onroad <- allFips[ allFips$type == "ON-ROAD", ]
  point <- allFips[ allFips$type == "POINT", ]
  lines( nonRoad$year, nonRoad$Emissions, col = "black" )
  lines( nonpoint$year, nonpoint$Emissions, col = "red" )
  lines( onroad$year, onroad$Emissions, col = "blue" )
  lines( point$year, point$Emissions, col = "green" )
  
  #setting up legend of the plot
  legend( x="topright", 
          legend=c("NON-ROAD","NONPOINT","ON-ROAD","POINT"),
          col=c("black","red","blue", "green"), lwd=1, 
          pch=c(NA,NA) )
  


}