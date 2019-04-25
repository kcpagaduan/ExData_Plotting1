household_power_consumption <- "./household_power_consumption.txt"
hhpconsump <- read.table(household_power_consumption, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
head(hhpconsump)

hhpconsump_subset <- hhpconsump[hhpconsump$Date == "1/2/2007" | hhpconsump$Date == "2/2/2007", ]
View(hhpconsump_subset)

global_active_power <- as.numeric(hhpconsump_subset$Global_active_power)

hist(global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
png("plot1.png", width = 480, height = 480)

dev.off()
