# Read the data table in the text file "household_power_consumption"
household_power_consumption <- "./household_power_consumption.txt"
hhpconsump <- read.table(household_power_consumption, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Assign a subset containing the data from the dates 2007-02-01 and 2007-02-02
hhpconsump_subset <- hhpconsump[hhpconsump$Date == "1/2/2007" | hhpconsump$Date == "2/2/2007", ]

# Convert data type in preparation for plotting graphs.
# Date and Time variables are converted to Date/Time classes using the strptime() function.
global_active_power <- as.numeric(hhpconsump_subset$Global_active_power)
DateTime_subset <- paste(hhpconsump_subset$Date, hhpconsump_subset$Time)
TimeSeries <- strptime(DateTime_subset,"%d/%m/%Y%H:%M:%S")

# Plot the graph using the plot function and create a png file of the graph plotted
png("plot2.png", width = 480, height = 480)
plot(TimeSeries, global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

# Shut off the device and close the plot
dev.off()
