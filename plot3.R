household_power_consumption <- "./household_power_consumption.txt"
hhpconsump <- read.table(household_power_consumption, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
head(hhpconsump)

hhpconsump_subset <- hhpconsump[hhpconsump$Date == "1/2/2007" | hhpconsump$Date == "2/2/2007", ]
View(hhpconsump_subset)

SubMetering1 <- as.numeric(hhpconsump_subset$Sub_metering_1)
SubMetering2 <- as.numeric(hhpconsump_subset$Sub_metering_2)
SubMetering3 <- as.numeric(hhpconsump_subset$Sub_metering_3)
DateTime <- paste(hhpconsump_subset$Date, hhpconsump_subset$Time, sep=" ")
TimeSeries <- strptime(DateTime, "%d/%m/%Y %H:%M:%S")

png("plot3.png", width = 480, height = 480)
plot(TimeSeries, SubMetering1, xlab = "", ylab = "Energy sub metering",  col="black", type = "l")
lines(TimeSeries, SubMetering2, col="red", type = "l")
lines(TimeSeries, SubMetering3, col="blue", type = "l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, 
       col=c("black", "red", "blue"))

dev.off()
