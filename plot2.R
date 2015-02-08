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

plot(subhousehold$y, subhousehold$Global_active_power, type ="l", lwd=1, 
     ylab="Global Active Power (kilowatts)",xlab="")

dev.print(png,filename="../plot2.png",
          width=480, height=480, pointsize=12, units="px")
          
  
          
          
          
