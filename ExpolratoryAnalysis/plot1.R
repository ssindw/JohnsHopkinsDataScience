# Johns Hopkins | Coursera -- Exploratory Data Analysis - Assignment 2 - Q1

# Loading provided datasets - loading from local machine

NEI <- readRDS(paste(getwd(),"/summarySCC_PM25.rds", sep=""))
SCC <- readRDS(paste(getwd(),"/Source_Classification_Code.rds",sep=""))

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
# for each of the years 1999, 2002, 2005, and 2008.

# Aggregate
Emissions <- aggregate(NEI$Emissions ~ NEI$year, FUN=sum)
colnames(Emissions) <- c("Year", "Emissions")
Emissions$PM <- round(Emissions[,2]/1000,2)

# Generate the graph in the same directory as the source code
png(filename= paste(getwd(), "/plot1.png", sep=""))

barplot(Emissions$PM, names.arg=Emissions$Year, 
        main=expression('Total Emission of PM'[2.5]), col="Salmon",
        xlab='Year', ylab=expression(paste('PM', ''[2.5], ' in Kilotons')))

dev.off()
