#How have emissions from motor vehicle sources changed from 1999–2008 in 
# Baltimore City?

## Read data
NEI <- readRDS("data/summarySCC_PM25.rds")

##Select data 
### Baltimore City, Maryland (fips == "24510") 
### On-road only
BaltimoreEmission.byMotor <-NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]

## Calculation
total.BaltimoreEmission.byMotor <- tapply(BaltimoreEmission.byMotor$Emissions,
                                          BaltimoreEmission.byMotor$year,sum)
##Generate graph
png(filename='plot5.png')
barplot(total.BaltimoreEmission.byMotor,
        main=expression(paste('Total Emission of PM', ''[2.5],
                              'by motor vehicle sources in Baltimore City"')),
        xlab='Year', ylab=expression(paste('PM', ''[2.5], ' in Kilotons')))
dev.off()