# point to household_power_consumption.txt
bd=read.csv("household_power_consumption.txt",header=T,sep=";")
# convert date
bd$date=as.Date(bd$Date,format="%d/%m/%Y")
# select subset
bd=bd[bd$date >= as.Date("2007-02-01") & bd$date <= as.Date("2007-02-02"),]
# Convert global active power
bd$Global_active_power=as.numeric(type.convert(as.character(bd$Global_active_power), dec = "."))
# Prepare data for plot2
bd$datahora=paste(bd$Date,bd$Time)
bd$datahora=strptime(bd$datahora,"%d/%m/%Y %H:%M:%S")
# Prepare for English week days
Sys.setlocale("LC_TIME", "English")
# plot in png file
png(filename="plot2.png", width=480, height=480, units="px")
plot(bd$datahora,as.numeric(bd$Global_active_power), xlab="", ylab="Global Active Power (kilowatts)",type="l")
dev.off()