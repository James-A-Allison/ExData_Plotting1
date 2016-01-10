download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "UCI_data.zip")
unzip("UCI_data.zip")
power <- read.table("household_power_consumption.txt", na.strings = "?", stringsAsFactors = F, sep = ";", header = T)
power <- power[power$Date == "1/2/2007" | power$Date == "2/2/2007",]
hist(power$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power", ylim = c(0,1200))
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()