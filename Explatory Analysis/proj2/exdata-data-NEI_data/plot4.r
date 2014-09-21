plot4 <- function()
{
  #reading the data from rds file
  SCC <- readRDS("Source_Classification_Code.rds")
  NEI <- readRDS("summarySCC_PM25.rds")
  
  #subsetting data
  combustion <- SCC[grepl("comb",SCC$Short.Name,ignore.case=TRUE),] #finding only combustion data
  onlyCoal <- combustion[grepl("coal",combustion$EI.Sector,ignore.case=TRUE),] #finding only coal based combustion data
  
  #correlating onlyCoal within NEI
  #merge from NEI where NEI$SCC are inside df$SCC
  correlated <- NEI[NEI$SCC %in% onlyCoal$SCC,]
  
  #finding a subset
  library(plyr)
  allFips <- ddply(correlated,.(year),numcolwise(sum))
  
  library(ggplot2)
  qplot( year, Emissions, data=allFips,main="North America Coal Combustion Emission",geom = c("point", "smooth") ) 
  
  
}