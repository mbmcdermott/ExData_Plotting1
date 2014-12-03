x<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c("character","character",rep("numeric",7)))

y<-as.Date(x[,1],format="%d/%m/%Y")
specdatedf<-x[y=="2007-02-01" | y=="2007-02-02", ]

datev<-strptime( paste(specdatedf[,1],specdatedf[,2]), format="%d/%m/%Y %H:%M:%S")

png(filename="plot2.png",width=480,height=480)
with(specdatedf,plot(datev,Global_active_power, xlab="", ylab = "Global Active Power (kilowatts)", type="n"))
with(specdatedf,lines(datev,Global_active_power))
dev.off()