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

# plot the histogram
hist(interesting_days[,"Global_active_power"])
