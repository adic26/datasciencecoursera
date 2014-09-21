plot6 <- function()
{
  
  #reading the data from rds file
  SCC <- readRDS("Source_Classification_Code.rds")
  NEI <- readRDS("summarySCC_PM25.rds")
  
  #subsetting data
  highway_vehicles <- SCC[grepl("Highway",SCC$Short.Name,ignore.case=TRUE),] #finding only combustion data
  
  #finding a subset
  library(plyr)
  baltimoreData <- NEI[ NEI$fips=="24510", ]
  LosAngelesData <- NEI[NEI$fips == "06037",]
  
  #merge from NEI where NEI$SCC are inside highway vehicles
  correlated_baltimore <- baltimoreData[baltimoreData$SCC %in% highway_vehicles$SCC,]
  correlated_LosAngeles <- LosAngelesData[LosAngelesData$SCC %in% highway_vehicles$SCC,]
  
  #subsetting by group type and year for baltimore city
  baltimore <- ddply(correlated_baltimore,.(year,fips),numcolwise(sum))
  
  #subsetting by group type and year for Los Angeles City
  LA <- ddply(correlated_LosAngeles,.(year,fips),numcolwise(sum))
  
  citiesEmissions <- data.frame()
  citiesEmissions <- rbind(baltimore,LA)
  
  
  library(ggplot2)
  sp <- ggplot(data=citiesEmissions,aes(x=year,y=Emissions,colour=fips)) + geom_smooth(se=FALSE) + ggtitle("Motor Vehicle Emissions")
  sp + scale_colour_discrete(name="City:",breaks = c("06037","24510"),
                           labels=c("Los Angeles County", "Baltimore"))
  
  
}