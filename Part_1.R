download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "UCI_data.zip")
unzip("UCI_data.zip")
power <- read.table("household_power_consumption.txt", na.strings = "?", stringsAsFactors = F, sep = ";", header = T)