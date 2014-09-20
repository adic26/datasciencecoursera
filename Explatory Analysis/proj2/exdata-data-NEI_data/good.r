myplot <- function()
{
  
  plot( x = goodShit$year, y = goodShit$Emissions,
        xlab = "",
        ylab = "Emissions",
        type = "n")
  
  nonRoad <- goodShit[ goodShit$type == "NON-ROAD", ]
  nonpoint <- goodShit[ goodShit$type == "NONPOINT", ]
  onroad <- goodShit[ goodShit$type == "ON-ROAD", ]
  point <- goodShit[ goodShit$type == "POINT", ]
  lines( nonRoad$year, nonRoad$Emissions, col = "black" )
  lines( nonpoint$year, nonpoint$Emissions, col = "red" )
  lines( onroad$year, onroad$Emissions, col = "blue" )
  lines( point$year, point$Emissions, col = "green" )
  


}