# Johns Hopkins | Coursera -- Exploratory Data Analysis - Assignment 2 - Q4

# Load ggplot2 library
library(ggplot2)

# Loading provided datasets - loading from local machine
NEI <- readRDS(paste(getwd(),"/summarySCC_PM25.rds", sep=""))
SCC <- readRDS(paste(getwd(),"/Source_Classification_Code.rds",sep=""))

# Merge the two data sets
NEISCC <- merge(NEI, SCC, by="SCC")

# Across the United States, how have emissions from coal combustion-related 
# sources changed from 1999-2008?

# Fetch all NEISCC records with Short.Name (SCC) Coal
coalMatches  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
subsetNEISCC <- NEISCC[coalMatches, ]

aggregateByYearAndType <- aggregate(Emissions ~ year, subsetNEISCC, sum)


png(filename= paste(getwd(), "/plot4.png", sep=""), width=640, height=480)
g <- ggplot(aggregateByYearAndType, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity", fill = "salmon", color = "black") +
        xlab("year") +
        ylab(expression('Total PM'[2.5]*" Emissions")) +
        ggtitle('Total Emissions from coal sources from 1999 to 2008')
print(g)
dev.off()
