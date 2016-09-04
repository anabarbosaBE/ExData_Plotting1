setwd("set wd here")

EPC <- read.csv("./household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
EPC$Date <- as.Date(EPC$Date, format = "%d/%m/%Y")
EPC_2007 <- subset(EPC, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

datetime <- paste(as.Date(EPC_2007$Date), EPC_2007$Time)
EPC_2007$Datetime <- as.POSIXct(datetime)
EPC_2007$Global_active_power <- as.numeric(as.character(EPC_2007$Global_active_power))
EPC_2007$Sub_metering_1 <- as.numeric(as.character(EPC_2007$Sub_metering_1))
EPC_2007$Sub_metering_2 <- as.numeric(as.character(EPC_2007$Sub_metering_2))
EPC_2007$Sub_metering_3 <- as.numeric(as.character(EPC_2007$Sub_metering_3))
EPC_2007$Global_reactive_power <- as.numeric(as.character(EPC_2007$Global_reactive_power))
  
png(file="Plot4.png",width=480,height=480)
par(mfrow=c(2,2), mar=c(4,4,4,4))
with(EPC_2007, {
  plot(Global_active_power~Datetime, type="l", ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l", ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~Datetime,col="red")
    lines(Sub_metering_3~Datetime, col="blue")
    legend("topright", col=c("black", "red", "blue"), lty=1, bty="n",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", ylab="global_reactive_power", xlab="datetime")
})
dev.off()


