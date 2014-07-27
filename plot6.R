#Compare emissions from motor vehicle sources in Baltimore City with emissions 
#from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
#Which city has seen greater changes over time in motor vehicle emissions?

##Read data
NEI <- readRDS("data/summarySCC_PM25.rds")

##Select data
###Baltimore City, Maryland (fips == "24510") 
###Los Angeles County, California (fips == "06037")
### On-road only
Emission.byMotor <-NEI[((NEI$fips=="24510") | (NEI$fips=="06037")) 
                       & (NEI$type=="ON-ROAD"),]


##Calulation
Emission.byMotor.aggregate <- aggregate(Emissions ~ year + fips, 
                                    data=Emission.byMotor, FUN =sum)
##Create city data 
Emission.byMotor.aggregate$city[Emission.byMotor.aggregate$fips=="24510"]<-"Baltimore"
Emission.byMotor.aggregate$city[Emission.byMotor.aggregate$fips=="06037"]<-"LA"

##generate Graph
### charge the ggplot2 library
library(ggplot2)
### make the graph
png(filename='plot6.png')
qplot(year,Emissions,data=Emission.byMotor.aggregate
      ,color= city
      ,xlab = "year"
      ,ylab = expression(paste('Emission of PM', ''[2.5]))
                               
      ,main = expression(paste('Compare vehicule emissions between Baltimore'
                               , 'City and LA'))
)

dev.off()