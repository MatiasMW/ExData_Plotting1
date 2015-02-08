household <- read.table("../household_power_consumption.txt",
                   header=TRUE, sep=";", na.strings="?", dec=".", strip.white=TRUE)



household1=household
household1$Date=as.Date(household1$Date, format="%d/%m/%Y")

subhousehold1=household1[household1$Date=="2007-02-01",]
subhousehold2=household1[household1$Date=="2007-02-02",]
subhousehold=rbind(subhousehold1,subhousehold2)

hist(subhousehold$Global_active_power, col="orange", xlab="Global Active Power
     (kilowatts)", ylab="Frequency", main= "Global Active Power")

dev.print(png,filename="../plot1.png",
          width=480, height=480, pointsize=12, units="px")
          
dev.off()  
