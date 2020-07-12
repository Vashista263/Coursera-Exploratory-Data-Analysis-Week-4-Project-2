EmissionsData <- readRDS("SummarySCC.rds")
View(EmissionsData)
ClassCode <- readRDS("SCC.rds")
View(ClassCode)

BaltimoreCarData <- subset(EmissionsData, EmissionsData$fips == "24510" & EmissionsData$type == "ON-ROAD")
BaltimoreCarYear <- aggregate(BaltimoreCarData$Emissions, by = list(BaltimoreCarData$year), FUN = sum)
colnames(BaltimoreCarYear) <- c("Year", "Emissions")

png(filename = "Plot5.png")
plot(BaltimoreCarYear$Year, BaltimoreCarYear$Emissions, type = "o", xlab = "Year",
     ylab = "Total Emissions (in tons)", main = "Total Emissions of PM 2.5 Related to Motor Vehicles",
     sub = "Baltimore City")
dev.off()