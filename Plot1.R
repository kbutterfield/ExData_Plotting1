
# 1. Set local directory where data is stored

setwd("C:/Users/C011204/Documents/GitRepo")


# 2. Read in data and select only 1/2/2007-2/2/2007 data

plotdata <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

plotsubset <-rbind(plotdata[plotdata$Date=="1/2/2007",],plotdata[plotdata$Date=="2/2/2007",])


# 3. Format date variable to date format

plotsubset$Date <- as.Date(plotsubset$Date,"%d/%m/%Y")

# 4. Create historgram of Global Active Power

hist(plotsubset$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#5.  Export and save as a PNG file 480 pixels x 480 pixels

dev.copy(png, file = "Plot1.png", width=480, height=480) ## Copy my plot to a PNG file
dev.off() ## Close the PNG device


