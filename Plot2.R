#############PLOT 2 vOLTAGE VS DATE TIME################################
#------------Dataset load and formatting----------------------------
TxtGlobal <- read.table("household_power_consumption.txt",skip=1,sep=";")

names(TxtGlobal) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#-----------------------ADJUST FORMAT AS DATE--------------------------
subTxtGlobal <- subset(TxtGlobal,TxtGlobal$Date=="1/2/2007" | TxtGlobal$Date =="2/2/2007")

subTxtGlobal$Date <- as.Date(subTxtGlobal$Date, format="%d/%m/%Y")
subTxtGlobal$Time <- strptime(subTxtGlobal$Time, format="%H:%M:%S")
subTxtGlobal[1:1440,"Time"] <- format(subTxtGlobal[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subTxtGlobal[1441:2880,"Time"] <- format(subTxtGlobal[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


#---------------Plot 2 function--------------------------------
plot(subTxtGlobal$Time,as.numeric(as.character(subTxtGlobal$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

#------------Format Graph------------------------------------------------
title(main="Global Active Power Vs Time")


