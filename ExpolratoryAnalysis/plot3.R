# Johns Hopkins | Coursera -- Exploratory Data Analysis - Assignment 2 - Q3

# Load ggplot2 library
library(ggplot2)

# Loading provided datasets - loading from local machine
NEI <- readRDS(paste(getwd(),"/summarySCC_PM25.rds", sep=""))
SCC <- readRDS(paste(getwd(),"/Source_Classification_Code.rds",sep=""))

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999 2008 for Baltimore City? 
# Which have seen increases in emissions from 1999 2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

# Subset data for Baltimore
subsetNEI  <- NEI[NEI$fips=="24510", ]

aggregateByYearAndType <- aggregate(Emissions ~ year + type, subsetNEI, sum)

png(filename= paste(getwd(), "/plot3.png", sep=""), width=640, height=480)
g <- ggplot(aggregateByYearAndType, aes(year, Emissions, color = type))
g <- g + geom_line() +
        xlab("year") +
        ylab(expression('Total PM'[2.5]*" Emissions")) +
        ggtitle('Total Emissions in Baltimore City, Maryland from 1999 to 2008')
print(g)
dev.off()
