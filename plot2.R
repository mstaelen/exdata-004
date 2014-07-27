#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
# from 1999 to 2008? 
##Use the base plotting system to make a plot answering this question.
### read data
NEI <- readRDS("data/summarySCC_PM25.rds")

### filter
####Baltimore City, Maryland (fips == "24510") 
BaltimoreEmission <- NEI[NEI$fips=="24510",]

### Sum calculation
total.BaltimoreEmission <- tapply(BaltimoreEmission$Emissions,
                                  BaltimoreEmission$year,sum)
### Generate graph
png(filename='plot2.png')
barplot(total.BaltimoreEmission/1000,
        main=expression(paste('Total Emission of PM', ''[2.5], ' in Baltimore City')),
        xlab='Year', ylab=expression(paste('PM', ''[2.5], ' in Kilotons')))
dev.off()
