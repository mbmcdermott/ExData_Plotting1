x<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c("character","character",rep("numeric",7)))

y<-as.Date(x[,1],format="%d/%m/%Y")
specdatedf<-x[y=="2007-02-01" | y=="2007-02-02", ]

datev<-strptime( paste(specdatedf[,1],specdatedf[,2]), format="%d/%m/%Y %H:%M:%S")

png(filename="plot3.png",width=480,height=480)
with(specdatedf,plot(datev,Sub_metering_1,xlab="",ylab="Energy sub metering",type="n"))
with(specdatedf,lines(datev,Sub_metering_1))
with(specdatedf,lines(datev,Sub_metering_2,col="red"))
with(specdatedf,lines(datev,Sub_metering_3,col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red", "blue" ), lty=c(1,1))
dev.off()