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
png("Plot2.png")
plot(interesting_days[,"Global_active_power"],,
     main="",
     ylab="Global Active Power (kilowatts)",
     type="l",
     xaxt="n")
axis(1,c(0,1440,2880),labels=c("Thu","Fri","Sat"))
dev.off()
