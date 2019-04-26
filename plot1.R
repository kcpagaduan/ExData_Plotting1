# Read the data table in the text file "household_power_consumption"
household_power_consumption <- "./household_power_consumption.txt"
hhpconsump <- read.table(household_power_consumption, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
head(hhpconsump)

# Assign a subset containing the data from the dates 2007-02-01 and 2007-02-02
hhpconsump_subset <- hhpconsump[hhpconsump$Date == "1/2/2007" | hhpconsump$Date == "2/2/2007", ]
View(hhpconsump_subset)

# Convert data type in preparation for plotting graphs
global_active_power <- as.numeric(hhpconsump_subset$Global_active_power)

# Plot the graph using the hist function and create a png file of the graph plotted
png("plot1.png", width = 480, height = 480)
hist(global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

# Shut off the device and close the plot
dev.off()
