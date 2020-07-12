EmissionsData <- readRDS("SummarySCC.rds")
View(EmissionsData)
ClassCode <- readRDS("SCC.rds")
View(ClassCode)

BData <- subset(EmissionsData, EmissionsData$fips=="24510")
BTypeYear <- aggregate(BData$Emissions, 
                                 by=list(BData$type, BData$year), 
                                 FUN=sum)
colnames(BTypeYear) <- c("Type", "Year", "Emissions")

install.packages("ggplot2")
library(ggplot2)
png(filename = "Plot3.png")
qplot(Year, Emissions, data = BTypeYear, color = Type, geom = "line") +
  ggtitle("Total Emissions of PM 2.5 in Baltimore City by Pollutant Type") + 
  ylab("Total Emissions (in tons)") + xlab("Year") 
dev.off()
