#Have total emissions from PM2.5 decreased in the United States 
# from 1999 to 2008? 
##Using the base plotting system, make a plot showing the total PM2.5 emission
##from all sources for each of the years 1999, 2002, 2005, and 2008.

### Read data
NEI <- readRDS("data/summarySCC_PM25.rds")
### Sum caculation 
totalEmission<- tapply(NEI$Emissions,NEI$year,sum)

### Generate graph
png(filename='plot1.png')
barplot(totalEmission/1000,
        main=expression('Total Emission of PM'[2.5]), 
        xlab='Year', ylab=expression(paste('PM', ''[2.5], ' in Kilotons')))
dev.off()