mysecond_plot <- function()
{

  
  
  preGoodShit <- NEI[ NEI$fips=="24510", ]
  trialSHit <- ddply(preGoodShit,.(year),numcolwise(sum))
  plot(trialSHit)
  mode <- lm(Emissions ~ year , trialSHit)
  abline(mode,lwd=2)
 
}