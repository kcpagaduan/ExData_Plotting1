# Read the data table in the text file "household_power_consumption"
household_power_consumption <- "./household_power_consumption.txt"
hhpconsump <- read.table(household_power_consumption, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Assign a subset containing the data from the dates 2007-02-01 and 2007-02-02
hhpconsump_subset <- hhpconsump[hhpconsump$Date == "1/2/2007" | hhpconsump$Date == "2/2/2007", ]

# Convert data type in preparation for plotting graphs
global_active_power <- as.numeric(hhpconsump_subset$Global_active_power)
global_reactive_power <- as.numeric(hhpconsump_subset$Global_reactive_power)
voltage <- as.numeric(hhpconsump_subset$Voltage)
submetering_1 <- as.numeric(hhpconsump_subset$Sub_metering_1)
Submetering_2 <- as.numeric(hhpconsump_subset$Sub_metering_2)
Submetering_3 <- as.numeric(hhpconsump_subset$Sub_metering_3)
DateTime <- paste(hhpconsump_subset$Date, hhpconsump_subset$Time, sep=" ")
TimeSeries <- strptime(DateTime, "%d/%m/%Y %H:%M:%S")

# Plot the graphs using multiple plot function and combine them with the par function with mfrow as an argument
# Create a png file of the graph plotted
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
plot(TimeSeries, global_active_power, xlab = "", ylab = "Global Active Power", type = "l")
plot(TimeSeries, voltage, xlab = "datetime", ylab = "Voltage", type = "l")
plot(TimeSeries, submetering_1, xlab = "", ylab = "Energy sub metering",  col="black", type = "l")
lines(TimeSeries, submetering_2, col="red", type = "l")
lines(TimeSeries, submetering_3, col="blue", type = "l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd=2, col=c("black", "red", "blue"), bty="o")
plot(TimeSeries, global_active_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")

# Shut off the device and close the plot
dev.off()
