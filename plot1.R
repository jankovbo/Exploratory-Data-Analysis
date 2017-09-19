data<-read.table("Fhousehold_power_consumption/household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
subSetData<-data[data$Date == "1/2/2007" | data$Date =="2/2/2007",]
View(subSetData)
class(subSetData$Global_active_power)
subSetData$Global_active_power<-as.numeric(as.character(subSetData$Global_active_power))
png("plot1.png", width=480, height=480)
hist(subSetData$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()