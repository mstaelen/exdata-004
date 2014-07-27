#Across the United States, how have emissions from coal combustion-related 
#sources changed from 1999–2008?

## Read data
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

## filter
### select all comb coal
select.combustion.Coal <- grepl("Comb.*Coal", SCC$EI.Sector,ignore.case=T)
combustion<-SCC[select.combustion.Coal,]
### limit the emissions to comb. coal
emissions <- NEI[(NEI$SCC %in% combustion$SCC), ]

## calculation 
totalEmission <- tapply(NEI$Emissions,NEI$year,sum)
## generate the graph
png(filename='plot4.png')
barplot(totalEmission/1000,
        main=expression(paste('Total Emission of PM',''[2.5], 
                              'for Emissions from coal combustion-related')), 
        xlab='Year',
        ylab=expression(paste('PM', ''[2.5], ' in Kilotons')))
dev.off()