# Johns Hopkins | Coursera -- Exploratory Data Analysis - Assignment 2 - Q2

# Loading provided datasets - loading from local machine
NEI <- readRDS(paste(getwd(),"/summarySCC_PM25.rds", sep=""))
SCC <- readRDS(paste(getwd(),"/Source_Classification_Code.rds",sep=""))

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
# from 1999 to 2008? Use the base plotting system to make a plot answering this question.

# Subset data for Baltimore City, Maryland
MD <- subset(NEI, fips=='24510')

# Generate the graph in the same directory as the source code
png(filename= paste(getwd(), "/plot2.png", sep=""))

barplot(tapply(X=MD$Emissions, INDEX=MD$year, FUN=sum), col = "Salmon", 
        main='Total Emission in Baltimore City, MD', 
        xlab='Year', ylab=expression('PM'[2.5]))

dev.off()