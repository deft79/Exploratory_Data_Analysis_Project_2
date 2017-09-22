## Plot 4
## Across the United States, how have emissions from coal combustion-related sources
## changed from 1999–2008?

##read summarySCC_PM25.rds and Source_Classification_Code.rds
dataFile <- "./exdata_data_NEI_data/summarySCC_PM25.rds"
NEI <- readRDS(dataFile)
dataFile2 <- "./exdata_data_NEI_data/Source_Classification_Code.rds"
SCC <- readRDS(dataFile2)

library(ggplot2)

NEISCC <- merge(NEI, SCC, by="SCC")

coalMatches  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
subsetNEISCC <- NEISCC[coalMatches, ]

aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEISCC, sum)


png("plot4.png", width=640, height=480)
g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions, color = year))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from coal sources from 1999 to 2008')
print(g)

## close device
dev.off()
