household_power_consumption <- "./household_power_consumption.txt"
hhpconsump <- read.table(household_power_consumption, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
head(hhpconsump)

hhpconsump_subset <- hhpconsump[hhpconsump$Date == "1/2/2007" | hhpconsump$Date == "2/2/2007", ]
View(hhpconsump_subset)

global_active_power <- as.numeric(hhpconsump_subset$Global_active_power)
DateTime_subset <- paste(hhpconsump_subset$Date, hhpconsump_subset$Time)
TimeSeries <- strptime(DateTime_subset,"%d/%m/%Y%H:%M:%S")

plot(TimeSeries, global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
png("plot2.png", width = 504, height = 504)

dev.off()