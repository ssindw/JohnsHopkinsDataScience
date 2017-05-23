# Johns Hopkins | Coursera -- Exploratory Data Analysis - Assignment 2 - Q5

# Load ggplot2 library
library(ggplot2)

# Loading provided datasets - loading from local machine
NEI <- readRDS(paste(getwd(),"/summarySCC_PM25.rds", sep=""))
SCC <- readRDS(paste(getwd(),"/Source_Classification_Code.rds",sep=""))

# merge the two data sets 
NEISCC <- merge(NEI, SCC, by="SCC")

# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
# NEI Type = "ON-ROAD"
subsetNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

aggregateByYear <- aggregate(Emissions ~ year, subsetNEI, sum)

png(filename= paste(getwd(), "/plot5.png", sep=""), width=840, height=480)
g <- ggplot(aggregateByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity", fill="Salmon", color="Black") +
        xlab("year") +
        ylab(expression('Total PM'[2.5]*" Emissions")) +
        ggtitle('Total Emissions from motor vehicle in Baltimore City, Maryland from 1999 to 2008')
print(g)
dev.off()
