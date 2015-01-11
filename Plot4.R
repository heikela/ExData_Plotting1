# Load the whole dataset.
# Assumes the data has been downloaded and the package unzipped manually
# into the working directory.
data <- read.csv("household_power_consumption.txt",
                 header = TRUE,
                 sep=";",
                 na.strings = "?",
                 colClasses=c("character", "character", rep("numeric",7)))

# select the days we're interested in
interesting_days <- data[data[["Date"]] == "1/2/2007" | data[["Date"]] == "2/2/2007",]

# Set up the 4 subplot grid
png("Plot4.png")
par(mfcol=c(2,2))

# Plot the Plot2-like time series
plot(interesting_days[,"Global_active_power"],,
     main="",
     ylab="Global Active Power",
     type="l",
     xaxt="n")
axis(1,c(0,1440,2880),labels=c("Thu","Fri","Sat"))

# plot the Plot3-like submetering time series
plot(interesting_days[,"Sub_metering_1"],,
     main="",
     ylab="Energy sub metering",
     type="l",
     xlab="",
     xaxt="n")
lines(interesting_days[,"Sub_metering_2"],,
      col="red")
lines(interesting_days[,"Sub_metering_3"],,
      col="blue")
axis(1,c(0,1440,2880),labels=c("Thu","Fri","Sat"))
legend("topright",
       lwd = 1,
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       bty="n")

# Plot a time series for the Voltage
plot(interesting_days[,"Voltage"],,
     main="",
     ylab="Voltage",
     xlab="datetime",
     type="l",
     xaxt="n")
axis(1,c(0,1440,2880),labels=c("Thu","Fri","Sat"))

# Plot a time series for the reactive power
plot(interesting_days[,"Global_reactive_power"],,
     main="",
     ylab="Global_reactive_power",
     xlab="datetime",
     type="l",
     xaxt="n")
axis(1,c(0,1440,2880),labels=c("Thu","Fri","Sat"))

dev.off()
