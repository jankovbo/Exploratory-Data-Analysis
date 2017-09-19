data<-read.table("Fhousehold_power_consumption/household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
subSetData<-data[data$Date == "1/2/2007" | data$Date =="2/2/2007",]
View(subSetData)

subSetData$TimeDate <-paste(subSetData$Date, subSetData$Time)
subSetData$TimeDate<-strptime(subSetData$TimeDate,format="%d/%m/%Y %H:%M:%S")

globalActivePower <- as.numeric(subSetData$Global_active_power)
Sub_metering_1 <- as.numeric(subSetData$Sub_metering_1)
Sub_metering_2 <- as.numeric(subSetData$Sub_metering_2)
Sub_metering_3<- as.numeric(subSetData$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
plot(subSetData$TimeDate,subSetData$Global_active_power,type="l",xlab="",ylab="Global Active Power")
plot(subSetData$TimeDate,subSetData$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(subSetData$TimeDate, subSetData$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(subSetData$TimeDate, subSetData$Sub_metering_2, type="l", col="red")
lines(subSetData$TimeDate, subSetData$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
plot(subSetData$TimeDate,subSetData$Global_reactive_power,type="l",xlab="detetime",ylab="Global_reactive_power")


dev.off()