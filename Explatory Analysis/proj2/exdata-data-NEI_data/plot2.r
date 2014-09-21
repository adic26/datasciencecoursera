plot2 <- function()
{
  #reading the data from rds file
  NEI <- readRDS("summarySCC_PM25.rds")
  
  #setting up subset of data using plyr package
  library(plyr)
  baltimoreCity <- NEI[ NEI$fips=="24510", ]
  collapsed <- ddply(baltimoreCity,.(year),numcolwise(sum))
  
  #setting up base plot
  plot(collapsed)
  title("Baltimore City Emissions")
  
  #Best Line of Fit
  mode <- lm(Emissions ~ year , collapsed)
  abline(mode,lwd=2)
  
  #Legend of the plot
  legend( x="bottomleft", 
          legend=c("Best Line of Fit"),
          col=c("black"), lwd=1, 
          pch=c(NA,NA) )
 
}