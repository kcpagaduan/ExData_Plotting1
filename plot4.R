household_power_consumption <- "./household_power_consumption.txt"
hhpconsump <- read.table(household_power_consumption, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
head(hhpconsump)

hhpconsump_subset <- hhpconsump[hhpconsump$Date == "1/2/2007" | hhpconsump$Date == "2/2/2007", ]
View(hhpconsump_subset)

global_active_power <- as.numeric(hhpconsump_subset$Global_active_power)
global_reactive_power <- as.numeric(hhpconsump_subset$Global_reactive_power)
voltage <- as.numeric(hhpconsump_subset$Voltage)
submetering_1 <- as.numeric(hhpconsump_subset$Sub_metering_1)
Submetering_2 <- as.numeric(hhpconsump_subset$Sub_metering_2)
Submetering_3 <- as.numeric(hhpconsump_subset$Sub_metering_3)
DateTime <- paste(hhpconsump_subset$Date, hhpconsump_subset$Time, sep=" ")
TimeSeries <- strptime(DateTime, "%d/%m/%Y %H:%M:%S")

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
plot(TimeSeries, global_active_power, xlab = "", ylab = "Global Active Power", type = "l")
plot(TimeSeries, voltage, xlab = "datetime", ylab = "Voltage", type = "l")
plot(TimeSeries, submetering_1, xlab = "", ylab = "Energy sub metering",  col="black", type = "l")
lines(TimeSeries, submetering_2, col="red", type = "l")
lines(TimeSeries, submetering_3, col="blue", type = "l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(TimeSeries, global_active_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")

dev.off()