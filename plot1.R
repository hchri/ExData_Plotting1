household_power_consumption <- read.csv("D:/coursera/ExData/ExData_Plotting1/household_power_consumption.txt", sep=";", quote="", stringsAsFactors=FALSE)

library(lubridate)


str(household_power_consumption)
household_power_consumption$Date <- dmy(household_power_consumption$Date)

household_power_consumption <- subset( household_power_consumption, as.Date(Date) >= as.Date("2007-02-01") & as.Date(Date) <= as.Date("2007-02-02"))

household_power_consumption$Time <- hms(household_power_consumption$Time)

household_power_consumption$Global_active_power <- as.numeric(household_power_consumption$Global_active_power)
household_power_consumption$Global_reactive_power <- as.numeric(household_power_consumption$Global_reactive_power)
household_power_consumption$Voltage <- as.numeric(household_power_consumption$Voltage)
household_power_consumption$Global_intensity <- as.numeric(household_power_consumption$Global_intensity)
household_power_consumption$Sub_metering_1 <- as.numeric(household_power_consumption$Sub_metering_1)
household_power_consumption$Sub_metering_2 <- as.numeric(household_power_consumption$Sub_metering_2)
household_power_consumption$Sub_metering_3 <- as.numeric(household_power_consumption$Sub_metering_3)



png(filename = "figure/plot1.png")
hist(household_power_consumption$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col ="red")
dev.off()
