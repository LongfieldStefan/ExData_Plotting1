library(dplyr)

dataRaw <- read.table("household_power_consumption.txt", sep = ";",header = TRUE, na.strings="?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
data <- tbl_df(dataRaw)
dataT <- mutate(data, Date = as.Date(Date, format = "%d/%m/%Y"))
courseData <- filter(dataT, Date == "2007-02-01" | Date == "2007-02-02")
courseData <- courseData[complete.cases(select(courseData, Global_active_power, Global_reactive_power, Voltage, Sub_metering_1,Sub_metering_2,Sub_metering_3))]
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

plot(courseData$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power", xaxt = "n")
axis(1, at = c(1,length(courseData$Global_active_power)/2,length(courseData$Global_active_power)), labels = c("Thu", "Fri", "Sat"))

plot(courseData$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", xaxt = "n")
axis(1, at = c(1,length(courseData$Voltage)/2,length(courseData$Voltage)), labels = c("Thu", "Fri", "Sat"))

plot(courseData$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", xaxt = "n")
lines(courseData$Sub_metering_2, col = "red")
lines(courseData$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n")
axis(1, at = c(1,length(courseData$Global_active_power)/2,length(courseData$Global_active_power)), labels = c("Thu", "Fri", "Sat"))

plot(courseData$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", xaxt = "n")
axis(1, at = c(1,length(courseData$Global_reactive_power)/2,length(courseData$Global_reactive_power)), labels = c("Thu", "Fri", "Sat"))

dev.off()