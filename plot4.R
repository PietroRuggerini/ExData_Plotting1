

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


#Plot 4

png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))
Sys.setlocale("LC_TIME", "English")
plot(data$Global_active_power~data$Datetime, type="l",ylab="Global Active Power", xlab="")
plot(data$Voltage~data$Datetime, type="l",ylab="Voltage", xlab="datetime")
plot(data$Sub_metering_1~data$Datetime,type="n",ylab="Energy sub metering", xlab="")
lines(data$Sub_metering_1~data$Datetime, type="l")
lines(data$Sub_metering_2~data$Datetime, type="l", col="red")
lines(data$Sub_metering_3~data$Datetime, type="l", col="blue")
legend("topright",col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1,bty="n")
plot(data$Global_reactive_power~data$Datetime, type="l",ylab="Global_reactive_power", xlab="datetime")
dev.off()
