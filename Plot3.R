
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

# 5. Create line graph of the 3 levels of Energy Sub Metering by Day of Week


with(plotsubset, {plot(Sub_metering_1 ~ Datetime, type="l", xlab= "", ylab="Energy Sub Metering")

lines(plotsubset$Sub_metering_2 ~ plotsubset$Datetime, col = 'Red')
lines(plotsubset$Sub_metering_3 ~ plotsubset$Datetime, col = 'Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


#6.  Export and save as a PNG file 480 pixels x 480 pixels

dev.copy(png, file = "Plot3.png", width=480, height=480) ## Copy my plot to a PNG file
dev.off() ## Close the PNG device