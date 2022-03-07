
#############PLOT 1 GLOBAL ACTIVE POWER VS DATETIME#############################
#------------Dataset load and formatting----------------------------
TxtGlobal <- read.table("household_power_consumption.txt",skip=1,sep=";")

names(TxtGlobal) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

subTxtGlobal <- subset(TxtGlobal,TxtGlobal$Date=="1/2/2007" | TxtGlobal$Date =="2/2/2007")

#---------------Plot 1 Histogram function--------------------------------
hist(as.numeric(as.character(subTxtGlobal$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
#------------Format Graph------------------------------------------------
title(main="Global Active Power")

png("plot1.png", width=480, height=480)

