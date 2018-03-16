
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

# 5. Create line graph of Global Active Power by day of week


with(plotsubset, {
  plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  })

#6.  Export and save as a PNG file 480 pixels x 480 pixels

dev.copy(png, file = "Plot2.png", width=480, height=480) ## Copy my plot to a PNG file
dev.off() ## Close the PNG device