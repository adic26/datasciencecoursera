PLOT1 <- function()
{
  #NEI <- readRDS("summarySCC_PM25.rds")
  library(plyr)
  allFlips <- ddply(NEI,.(type,year),numcolwise(sum))
  plot( x = allFlips$year, y = allFlips$Emissions,
        xlab = "Year",
        ylab = "Emissions",
        type = "n"
        )
  title("Emissions for All Types")
  nonRoad <- allFlips[ allFlips$type == "NON-ROAD", ]
  nonpoint <- allFlips[ allFlips$type == "NONPOINT", ]
  onroad <- allFlips[ allFlips$type == "ON-ROAD", ]
  point <- allFlips[ allFlips$type == "POINT", ]
  lines( nonRoad$year, nonRoad$Emissions, col = "black" )
  lines( nonpoint$year, nonpoint$Emissions, col = "red" )
  lines( onroad$year, onroad$Emissions, col = "blue" )
  lines( point$year, point$Emissions, col = "green" )
  legend( x="topright", 
          legend=c("NON-ROAD","NONPOINT","ON-ROAD","POINT"),
          col=c("black","red","blue", "green"), lwd=1, 
          pch=c(NA,NA) )
  


}