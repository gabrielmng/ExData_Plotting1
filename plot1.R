# point to household_power_consumption.txt
bd=read.csv("household_power_consumption.txt",header=T,sep=";")
# convert date
bd$date=as.Date(bd$Date,format="%d/%m/%Y")
# select subset
bd=bd[bd$date >= as.Date("2007-02-01") & bd$date <= as.Date("2007-02-02"),]
# Convert global active power
bd$Global_active_power=as.numeric(type.convert(as.character(bd$Global_active_power), dec = "."))
# Prepare for English week days
Sys.setlocale("LC_TIME", "English")
# plot in png file
png(filename="plot1.png", width=480, height=480, units="px")
hist(as.numeric(bd$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
