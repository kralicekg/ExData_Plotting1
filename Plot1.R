library(lattice)
setwd("c:/ExploratoryDataAnalysis/")
Elec_Power <- read.table("household_power_consumption.txt",na.strings="?",sep=";",header=TRUE,stringsAsFactors=FALSE)

Elec_Power_Working <- Elec_Power[Elec_Power[,"Date"] == '1/2/2007' | Elec_Power[,"Date"] == '2/2/2007',]
for (i in 1:nrow(Elec_Power_Working)) {
  Elec_Power_Working[i,"Date"] = paste(substr(Elec_Power_Working[i,"Date"],5,8),substr(Elec_Power_Working[i,"Date"],3,3),substr(Elec_Power_Working[i,"Date"],1,1),sep="-")
}
Elec_Power_Working$Date <- as.Date(Elec_Power_Working$Date)
Elec_Power_Working$DateTime <- strptime(paste(Elec_Power_Working$Date,Elec_Power_Working$Time,sep=" "),format="%Y-%m-%d %H:%M:%S")

## Plot 1
par(mfrow=c(1,1))
png(filename="plot1.png")
hist(Elec_Power_Working$Global_active_power,col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
