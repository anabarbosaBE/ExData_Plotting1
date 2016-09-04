setwd("set wd here")

EPC <- read.csv("./household_power_consumption.txt", sep=";", header=TRUE)
EPC$Date <- as.Date(EPC$Date, format = "%d/%m/%Y")
EPC_2007 <- subset(EPC, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

datetime <- paste(as.Date(EPC_2007$Date), EPC_2007$Time)
EPC_2007$Datetime <- as.POSIXct(datetime)
EPC_2007$Sub_metering_1 <- as.numeric(as.character(EPC_2007$Sub_metering_1))
EPC_2007$Sub_metering_2 <- as.numeric(as.character(EPC_2007$Sub_metering_2))
EPC_2007$Sub_metering_3 <- as.numeric(as.character(EPC_2007$Sub_metering_3))

png(file="Plot3.png",width=480,height=480)
with(EPC_2007, {
  plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime, type="l",col="red")
  lines(Sub_metering_3~Datetime, type="l",col="blue")
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

