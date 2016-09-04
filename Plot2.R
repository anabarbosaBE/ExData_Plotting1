setwd("set wd here")

EPC <- read.csv("./household_power_consumption.txt", sep=";", header=TRUE)
EPC$Date <- as.Date(EPC$Date, format = "%d/%m/%Y")
EPC_2007 <- subset(EPC, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

datetime <- paste(as.Date(EPC_2007$Date), EPC_2007$Time)
EPC_2007$Datetime <- as.POSIXct(datetime)
EPC_2007$Global_active_power <- as.numeric(as.character(EPC_2007$Global_active_power))

png(file="Plot2.png",width=480,height=480)
plot(EPC_2007$Global_active_power~EPC_2007$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()