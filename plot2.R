data<-read.table("Fhousehold_power_consumption/household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
subSetData<-data[data$Date == "1/2/2007" | data$Date =="2/2/2007",]
View(subSetData)

class(subSetData$Time)
class(subSetData$Date)

subSetData$TimeDate <-paste(subSetData$Date, subSetData$Time)
subSetData$TimeDate<-strptime(subSetData$TimeDate,format="%d/%m/%Y %H:%M:%S")


View(subSetData)

subSetData$Global_active_power<-as.numeric(as.character(subSetData$Global_active_power))

png("plot2.png", width=480, height=480)

plot(subSetData$TimeDate,subSetData$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)") 
title(main="Global Active Power Vs Time")

dev.off()
