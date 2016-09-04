setwd("set wd here")

EPC <- read.csv("./household_power_consumption.txt", na.strings="?", sep=";", header=TRUE)

EPC$Date <- as.Date(EPC$Date, format = "%d/%m/%Y")

EPC_2007 <- subset(EPC, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

EPC_2007$Time <- as.POSIXct(strptime(EPC_2007$Time, "%H:%M:%S"))

png(file="Plot1.png",width=480,height=480)
hist(EPC_2007$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
dev.off()


