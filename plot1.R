x<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c("character","character",rep("numeric",7)))

y<-as.Date(x[,1],format="%d/%m/%Y")
specdatedf<-x[y=="2007-02-01" | y=="2007-02-02", ]

png(filename="plot1.png",width=480,height=480)
with(specdatedf,hist(Global_active_power,xlab="Global Active Power (kilowatts)", main="Global Active Power",col="red"))
dev.off()