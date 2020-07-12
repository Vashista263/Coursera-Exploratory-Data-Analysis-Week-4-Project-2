EmissionsData <- readRDS("SummarySCC.rds")
View(EmissionsData)
ClassCode <- readRDS("SCC.rds")
View(ClassCode)

CoalClassCode <- ClassCode[grepl("Coal", ClassCode$Short.Name), ]
CoalEmissionsData <- EmissionsData[EmissionsData$SCC %in% CoalClassCode$SCC, ]

CoalEmissionsYear <- aggregate(CoalEmissionsData$Emissions, by = list(CoalEmissionsData$year), FUN = sum)
colnames(CoalEmissionsYear) <- c("Year", "Emissions")

png(filename = "Plot4.png")
plot(CoalEmissionsYear$Year, CoalEmissionsYear$Emissions, type = "o", xlab = "Year",
     ylab = "Total Emissions (in tons)", main = "Coal Related Emissions of PM 2.5 in US from 1999-2008")
dev.off()