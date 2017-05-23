# Johns Hopkins | Coursera -- Exploratory Data Analysis - Assignment 2 - Q6

# Load ggplot2 library
library(ggplot2)

# Loading provided datasets - loading from local machine
NEI <- readRDS(paste(getwd(),"/summarySCC_PM25.rds", sep=""))
SCC <- readRDS(paste(getwd(),"/Source_Classification_Code.rds",sep=""))

# merge the two data sets 
NEISCC <- merge(NEI, SCC, by="SCC")

# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor 
# vehicle sources in Los Angeles County, California  
# Which city has seen greater changes over time in motor vehicle emissions?

# Searching for ON-ROAD type in NEI
subsetNEI <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

aggregateByYearAndFips <- aggregate(Emissions ~ year + fips, subsetNEI, sum)
aggregateByYearAndFips$fips[aggregateByYearAndFips$fips=="24510"] <- "Baltimore, MD"
aggregateByYearAndFips$fips[aggregateByYearAndFips$fips=="06037"] <- "Los Angeles, CA"

png(filename= paste(getwd(), "/plot6.png", sep=""), width=640, height=480)

g <- ggplot(aggregateByYearAndFips, aes(year, Emissions, color=fips))
g <- g + geom_line() +
        xlab("year") +
        ylab(expression('Total PM'[2.5]*" Emissions")) +
        ggtitle('Total Emissions from motor vehicle in Baltimore City, MD vs 
                Los Angeles, CA between 1999-2008')

print(g)
dev.off()
