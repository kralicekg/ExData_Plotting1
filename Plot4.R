library(lattice)
setwd("c:/ExploratoryDataAnalysis/")
Elec_Power <- read.table("household_power_consumption.txt",na.strings="?",sep=";",header=TRUE,stringsAsFactors=FALSE)

Elec_Power_Working <- Elec_Power[Elec_Power[,"Date"] == '1/2/2007' | Elec_Power[,"Date"] == '2/2/2007',]
for (i in 1:nrow(Elec_Power_Working)) {
  Elec_Power_Working[i,"Date"] = paste(substr(Elec_Power_Working[i,"Date"],5,8),substr(Elec_Power_Working[i,"Date"],3,3),substr(Elec_Power_Working[i,"Date"],1,1),sep="-")
}
Elec_Power_Working$Date <- as.Date(Elec_Power_Working$Date)
Elec_Power_Working$DateTime <- strptime(paste(Elec_Power_Working$Date,Elec_Power_Working$Time,sep=" "),format="%Y-%m-%d %H:%M:%S")

## Plot 4
png(filename="plot4.png")
par(mfrow=c(2,2))
plot(x=Elec_Power_Working$DateTime, y=Elec_Power_Working$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
plot(x=Elec_Power_Working$DateTime, y=Elec_Power_Working$Voltage, type="l",ylab="Voltage", xlab="datetime")
plot(x=Elec_Power_Working$DateTime, y=Elec_Power_Working$Sub_metering_1, type="l", ylab="Energy sub metering", xlab=" ")
points(x=Elec_Power_Working$DateTime, y=Elec_Power_Working$Sub_metering_2, type="l", col='red')
points(x=Elec_Power_Working$DateTime, y=Elec_Power_Working$Sub_metering_3, type="l", col='blue')
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1))
plot(x=Elec_Power_Working$DateTime, y=Elec_Power_Working$Global_reactive_power, type="l",ylab="Global_reactive_power", xlab="datetime")
dev.off()
