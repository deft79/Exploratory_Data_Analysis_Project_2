## Plot 1
## Have total emissions from PM2.5 decreased in the United States from 1999 
## to 2008? 
## Using the base plotting system, make a plot showing the total PM2.5 
## emission from all sources for each of the years 1999, 2002, 2005, and 
## 2008.

##read summarySCC_PM25.rds and Source_Classification_Code.rds
dataFile <- "./exdata_data_NEI_data/summarySCC_PM25.rds"
NEI <- readRDS(dataFile)
dataFile2 <- "./exdata_data_NEI_data/Source_Classification_Code.rds"
SCC <- readRDS(dataFile2)

Emissions <- aggregate(NEI[, 'Emissions'], by=list(NEI$year), FUN=sum)

png('plot1.png', width=480, height=480)

## plot data
plot(plotdata$year, plotdata$Emissions, type = "l", 
     main = "Total PM2.5 Emission in the US 1999-2008",
     xlab = "Year", ylab = "Emissions")

## close device
dev.off()




