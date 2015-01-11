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

# plot the time series
png("Plot3.png")
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
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
