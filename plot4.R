household <- read.table("../household_power_consumption.txt",
                        header=TRUE, sep=";", na.strings="?", dec=".", strip.white=TRUE)



household1=household
household1$Date=as.Date(household1$Date, format="%d/%m/%Y")

subhousehold1=household1[household1$Date=="2007-02-01",]
subhousehold2=household1[household1$Date=="2007-02-02",]
subhousehold=rbind(subhousehold1,subhousehold2)


dates<-as.character(subhousehold$Date)
times<-as.character(subhousehold$Time)
subhousehold$x<-paste(dates,times)
subhousehold$y<-strptime(subhousehold$x, "%Y-%m-%d %H:%M:%S", tz="%Z")




par(mfcol=c(2,2), mar=c(4,4,2,1))

plot(subhousehold$y, subhousehold$Global_active_power, type ="l", lwd=1, 
     ylab="Global Active Power (kilowatts)", xlab="")

plot(subhousehold$y, subhousehold$Sub_metering_1, type ="l", lwd=1, 
     ylab="Energy sub metering",xlab="")
lines(subhousehold$y, subhousehold$Sub_metering_2, col="red")
lines(subhousehold$y, subhousehold$Sub_metering_3, col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       pch=19, cex=0.3, col=c("black","Red","Blue"))


plot(subhousehold$y, subhousehold$Voltage, type ="l", lwd=1, 
     ylab="Global Active Power (kilowatts)", xlab="datetime")

plot(subhousehold$y, subhousehold$Global_reactive_power, type ="l", lwd=1, 
     ylab="Global Active Power (kilowatts)", xlab="datetime")

dev.print(png,filename="../plot4.png",
          width=480, height=480, pointsize=12, units="px")
