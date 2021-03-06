## Plot 2
## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
## (fips == "24510" ) from 1999 to 2008? 
## Use the base plotting system to make a plot answering this question.

##read summarySCC_PM25.rds and Source_Classification_Code.rds
dataFile <- "./exdata_data_NEI_data/summarySCC_PM25.rds"
NEI <- readRDS(dataFile)
dataFile2 <- "./exdata_data_NEI_data/Source_Classification_Code.rds"
SCC <- readRDS(dataFile2)

## subset baltimore data
subsetNEIBC  <- NEI[NEI$fips=="24510", ]
plotdata <- aggregate(subsetNEIBC[c("Emissions")], list(year = subsetNEIBC$year), sum)

# create plot
png('plot2.png', width=480, height=480)

plot(plotdata$year, plotdata$Emissions, type = "l", main = "Total PM2.5 Emission in Baltimore 1999-2008",xlab = "Year", ylab = "Emissions")

## close device
dev.off()
