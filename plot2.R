# filename of the file with subseted data
filename <- 'sdata.txt'

#header data
colNames = c("date", "time", "globalActivePower", "globalReactivePower", "voltage", "globalIntensity", "subMetering1", "subMetering2", "subMetering3")
colClasses = c("character", "character", rep("numeric",7) )

#read file contents
df <- read.table(filename, header=TRUE, sep=";", col.names=colNames, colClasses=colClasses, na.strings="?")

#convert to Date
df$date = as.Date(df$date, format="%d/%m/%Y")


#plot and save PNG
png(filename="plot2.png", width=480, height=480, units="px")
plot(df$globalActivePower, type="l",xaxt="n",xlab="", ylab="Global Active Power (kilowatts)")
axis(1, at=c(1, as.integer(nrow(df)/2), nrow(df)), labels=c("Thu", "Fri", "Sat"))
dev.off()