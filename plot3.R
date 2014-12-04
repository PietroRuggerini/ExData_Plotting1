## Getting full dataset
data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## Subsetting the data
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

#Plot 3

png("plot3.png",width=480,height=480)
Sys.setlocale("LC_TIME", "English")
plot(data$Sub_metering_1~data$Datetime,type="n",ylab="Energy sub metering", xlab="")
lines(data$Sub_metering_1~data$Datetime, type="l")
lines(data$Sub_metering_2~data$Datetime, type="l", col="red")
lines(data$Sub_metering_3~data$Datetime, type="l", col="blue")
legend("topright",col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1)
dev.off()
