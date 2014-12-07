library(dplyr)

dataRaw <- read.table("household_power_consumption.txt", sep = ";",header = TRUE, na.strings="?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
data <- tbl_df(dataRaw)
dataT <- mutate(data, Date = as.Date(Date, format = "%d/%m/%Y"))
courseData <- filter(dataT, Date == "2007-02-01" | Date == "2007-02-02")
courseData <- courseData[!is.na(courseData$Global_active_power)]
png("plot1.png", width = 480, height = 480)
hist(courseData$Global_active_power,main = "Global Active Power", xlab = "Global Active Power(kilowatts)", ylab = "Frequency", col = "red")
dev.off()