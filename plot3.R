#Of the four types of sources indicated by the type (point, nonpoint, onroad, 
# nonroad) variable, which of these four sources have seen decreases in 
#emissions from 1999–2008 for Baltimore City? 
#Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting 
#system to make a plot answer this question.

##Read data
NEI <- readRDS("data/summarySCC_PM25.rds")

## filter
### select only baltimore's emission
BaltimoreEmission <- NEI[NEI$fips=="24510",]

## Calulation 
BaltimoreEmission.aggregate <- aggregate(Emissions ~ year + type, 
                                         data=BaltimoreEmission, FUN =sum)

## Generate graph
### charge the ggplot2 library
library(ggplot2)
### make the graph
png(filename='plot3.png',width=580,height=480,units="px")
ggplot(BaltimoreEmission.aggregate, aes(x=factor(year), y=Emissions, fill=type)) +
        geom_bar(stat="identity") +
        facet_grid(. ~ type) +
        xlab("year") +
        ylab(expression("total PM"[2.5]*" emission")) +
        ggtitle(expression("PM"[2.5]*paste(" emissions in Baltimore ",
                                           "City with various source types")))
dev.off()                                          
