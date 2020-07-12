EmissionsData <- readRDS("SummarySCC.rds")
View(EmissionsData)
ClassCode <- readRDS("SCC.rds")
View(ClassCode)

BData <- subset(EmissionsData, EmissionsData$fips == "24510")
BDataYear <- aggregate(BData$Emissions, by = list(BData$year), FUN = sum)

png(filename = "Plot2.png")
plot(BDataYear$Group.1, BDataYear$x, type = "l", main = "Total Emissions of PM 2.5 in Baltimore City",
     xlab = "Year", ylab = "Total Emissions (in tons)")
dev.off()