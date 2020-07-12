EmissionsData <- readRDS("SummarySCC.rds")
View(EmissionsData)
ClassCode <- readRDS("SCC.rds")
View(ClassCode)

BaltimoreLACarData <- subset(EmissionsData, EmissionsData$fips=="24510" | EmissionsData$fips == "06037" &
                            EmissionsData$type == "ON-ROAD")
BaltimoreLACarYear <- aggregate(BaltimoreLACarData$Emissions, by = list(BaltimoreLACarData$fips, BaltimoreLACarData$year),
                             FUN = sum)
colnames(BaltimoreLACarYear) <- c("City", "Year", "Emissions")

library(ggplot2)
png(filename = "Plot6.png")
qplot(Year, Emissions, data = BaltimoreLACarYear, color = City, geom = "line") +
  ggtitle("Emissions of PM 2.5 in Baltimore City (24510) and LA County (06037)") + 
  ylab("Total Emissions from motor vehicles (tons)") +  xlab("Year") 
dev.off()