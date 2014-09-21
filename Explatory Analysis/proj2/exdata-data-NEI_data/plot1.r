plot1 <- function()
{
  #reading the data from rds file
  NEI <- readRDS("summarySCC_PM25.rds")
  
  #setting up subdata to get sum of Emissions groups by Type and Year
  library(plyr)
  allFips <- ddply(NEI,.(year),numcolwise(sum))
  
  #Base plotting Skeleton
  plot( x = allFips$year, y = allFips$Emissions,
        xlab = "Year",
        ylab = "Emissions",
        type = "n"
        )
  title("Emissions")
  
  #setting up each line per type
  lines( allFips$year, allFips$Emissions, col = "black" )
  
  #setting up legend of the plot
  legend( x="topright", 
          legend=c("PM2.5 Emissions"),
          col=c("black"), lwd=1, 
          pch=c(NA,NA) )
  


}