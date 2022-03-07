##############PLOT 3 ENERGY SUB METERING VS DATE TIME######################

#------------Dataset load and formatting----------------------------
TxtGlobal <- read.table("household_power_consumption.txt",skip=1,sep=";")

names(TxtGlobal) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

subTxtGlobal <- subset(TxtGlobal,TxtGlobal$Date=="1/2/2007" | TxtGlobal$Date =="2/2/2007")

#-----------------------ADJUST FORMAT AS DATE --------------------------
subTxtGlobal$Date <- as.Date(subTxtGlobal$Date, format="%d/%m/%Y")
subTxtGlobal$Time <- strptime(subTxtGlobal$Time, format="%H:%M:%S")
subTxtGlobal[1:1440,"Time"] <- format(subTxtGlobal[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subTxtGlobal[1441:2880,"Time"] <- format(subTxtGlobal[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


#---------------Plot 3 functions--------------------------------
plot(subTxtGlobal$Time,subTxtGlobal$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(subTxtGlobal,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(subTxtGlobal,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(subTxtGlobal,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


#------------Format Graph------------------------------------------------
title(main="Energy sub-metering")
