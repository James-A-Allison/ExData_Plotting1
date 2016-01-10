download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "UCI_data.zip")
unzip("UCI_data.zip")
power <- read.table("household_power_consumption.txt", na.strings = "?", stringsAsFactors = F, sep = ";", header = T)
power <- power[power$Date == "1/2/2007" | power$Date == "2/2/2007",]
power$Date[power$Date == "1/2/2007"] <- "01/02/2007"
power$Date[power$Date == "2/2/2007"] <- "02/02/2007"
power$date_time <- paste(power$Date, power$Time)
power$date_time <- strptime(power$date_time, "%d/%m/%Y %H:%M:%S")


plot(power$date_time, power$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")


dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()