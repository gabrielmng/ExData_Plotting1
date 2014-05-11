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
png(filename="plot3.png", width=480, height=480, units="px")
with(bd , {
  plot(datahora,Sub_metering_1, type="l", col="black", ann=FALSE)
  lines(datahora,Sub_metering_2,type="l",col="red")
  lines(datahora, Sub_metering_3, type="l", col="blue")
  title( ylab="Energy sub metering" )
  
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=c(1, 1, 1),col=c("black", "red", "blue")
  )
})
dev.off()