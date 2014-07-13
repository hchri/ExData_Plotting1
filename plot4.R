
#reading data

household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", quote="", stringsAsFactors=FALSE)


#ensuring the correct format of data
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


png(filename = "figure/plot4.png")
opar <- par()
par( mfrow = c(2,2))
#ensurung the correct language for weekdays abbriviations
Sys.setlocale("LC_TIME", "UK")
plot(household_power_consumption$Date + household_power_consumption$Time, household_power_consumption$Global_active_power, type = "l", xlab = NA, ylab = "Global Active Power (kilowatts)")

plot(household_power_consumption$Date + household_power_consumption$Time, household_power_consumption$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(household_power_consumption$Date + household_power_consumption$Time, household_power_consumption$Sub_metering_1,type = "l", xlab = NA, ylab = "Energy sub metering")
lines(household_power_consumption$Date + household_power_consumption$Time, household_power_consumption$Sub_metering_2, col = "red")
lines(household_power_consumption$Date + household_power_consumption$Time, household_power_consumption$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1 )

plot(household_power_consumption$Date + household_power_consumption$Time, household_power_consumption$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
par(opar)
dev.off()
