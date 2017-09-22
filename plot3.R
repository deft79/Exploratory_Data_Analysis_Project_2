## Plot 3
## Of the four types of sources indicated by the type  (point, nonpoint, onroad, nonroad) variable, 
## which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
## Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to 
## make a plot answer this question.

##read summarySCC_PM25.rds and Source_Classification_Code.rds
dataFile <- "./exdata_data_NEI_data/summarySCC_PM25.rds"
NEI <- readRDS(dataFile)
dataFile2 <- "./exdata_data_NEI_data/Source_Classification_Code.rds"
SCC <- readRDS(dataFile2)

library(ggplot2)

# Subset the vehicles NEI data to Baltimore's fip
subsetNEIBC  <- NEI[NEI$fips=="24510", ]

aggregatedTotalByYearAndType <- aggregate(Emissions ~ year + type, subsetNEIBC, sum)

png("plot3.png", width=640, height=480)
g <- ggplot(aggregatedTotalByYearAndType, aes(year, Emissions, color = type))
g <- g + geom_line() +xlab("year") +ylab(expression('Total PM'[2.5]*" Emissions")) +ggtitle('Total Emissions in Baltimore City, Maryland (fips == "24510") from 1999 to 2008')
print(g)

## close device
dev.off()
