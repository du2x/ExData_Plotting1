filename <- 'sdata.txt'

#header data
colNames = c("date", "time", "globalActivePower", "globalReactivePower", "voltage", "globalIntensity", "subMetering1", "subMetering2", "subMetering3")
colClasses = c("character", "character", rep("numeric",7) )

#read file contents
df <- read.table(filename, header=TRUE, sep=";", col.names=colNames, colClasses=colClasses, na.strings="?")

#convert to Date
df$date = as.Date(df$date, format="%d/%m/%Y")

#plot and save PNG
png(filename="plot1.png", width=480, height=480, units="px")
hist(df$globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
