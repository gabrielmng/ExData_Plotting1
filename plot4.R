# point to household_power_consumption.txt
bd=read.csv("household_power_consumption.txt",header=T,sep=";")
# convert date
bd$date=as.Date(bd$Date,format="%d/%m/%Y")
# select subset
bd=bd[bd$date >= as.Date("2007-02-01") & bd$date <= as.Date("2007-02-02"),]
# Convert global active power
bd$Global_active_power=as.numeric(type.convert(as.character(bd$Global_active_power), dec = "."))
bd$Sub_metering_1=as.numeric(type.convert(as.character(bd$Sub_metering_1), dec = "."))
bd$Sub_metering_2=as.numeric(type.convert(as.character(bd$Sub_metering_2), dec = "."))
bd$Sub_metering_3=as.numeric(type.convert(as.character(bd$Sub_metering_3), dec = "."))
# Prepare data for plot2
bd$datahora=paste(bd$Date,bd$Time)
bd$datahora=strptime(bd$datahora,"%d/%m/%Y %H:%M:%S")
# Prepare for English week days
Sys.setlocale("LC_TIME", "English")
# plot in png file
png(filename="plot4.png", width=480, height=480, units="px")
par(mfcol=c(2,2))
with(bd,{
      # Plot 1
    plot(datahora, Global_active_power,type="l",ylab="Global Active Power", xlab="", cex.lab=0.9)
      # Plot 2
    plot(datahora,Sub_metering_1, type="l", col="black", ylab="Energy sub metering", xlab="", cex.lab=0.9 )
    lines(datahora,Sub_metering_2,type="l", col="red" )
    lines(datahora,Sub_metering_3,type="l",col="blue")
    legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=c(1, 1, 1),col=c("black", "red", "blue"),y.intersp=0.75, cex=0.9,bty="n")
    # Plot 3
    plot(datahora, Voltage, type="l", ylab="Voltage", xlab="datetime", cex.lab=0.9)
      # Plot 4
    plot(datahora, Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime", cex.lab=0.9)
  }
  )
  dev.off()