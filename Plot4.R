
# 1. Set local directory where data is stored

setwd("C:/Users/C011204/Documents/GitRepo")


# 2. Read in data and select only 1/2/2007-2/2/2007 data

plotdata <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

plotsubset <-rbind(plotdata[plotdata$Date=="1/2/2007",],plotdata[plotdata$Date=="2/2/2007",])


# 3. Format date variable to date format

plotsubset$Date <- as.Date(plotsubset$Date,"%d/%m/%Y")

# 4. Format date time variable

datetime <- paste(as.Date(plotsubset$Date), plotsubset$Time)
plotsubset$Datetime <- as.POSIXct(datetime)

# 5. Create 4 plots: 1) Global Active Power by Day, 2) Voltage by Day, 3) Sub metering by day , 4)Global reactive power by day

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(plotsubset, {plot(Global_active_power~Datetime, type="l", ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l", ylab="Voltage", xlab="")
  plot(Sub_metering_1~Datetime, type="l", ylab="Energy Sub Metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power",xlab="")
})


#6.  Export and save as a PNG file 480 pixels x 480 pixels

dev.copy(png, file = "Plot4.png", width=480, height=480) ## Copy my plot to a PNG file
dev.off() ## Close the PNG device