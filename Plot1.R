EmissionsData <- readRDS("SummarySCC.rds")
View(EmissionsData)
ClassCode <- readRDS("SCC.rds")
View(ClassCode)

TotalSum <- aggregate(EmissionsData$Emissions, by = list(year = EmissionsData$year), FUN = sum)

png(filename = "Plot1.png")
plot(TotalSum$year, TotalSum$x, type = "l", main = "Total Emission of PM 2.5 in Baltimore City",
     xlab = "Year", ylab = "Total Emissions of PM 2.5 (in tons)")
dev.off()