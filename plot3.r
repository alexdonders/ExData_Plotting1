df = read.csv('household_power_consumption.txt', header = T, sep = ';', na.strings='?',
              nrows=2075259, check.names = FALSE, stringsAsFactors = FALSE, comment.char="", quote='\"')


sf = subset(df, Date %in% c('1/2/2007', '2/2/2007'))
sf$Date = as.Date(sf$Date, format='%d/%m/%Y')
datetime = paste(as.Date(sf$Date), sf$Time)
sf$Datetime = as.POSIXct(datetime)

############
# Plot 3

with(sf, {
  plot(Sub_metering_1 ~ Datetime,
       type = 'l',
       xlab = '',
       ylab = 'Global Active Power (kilowatts)'
  )
  lines(Sub_metering_2 ~ Datetime, col = 'Red')
  lines(Sub_metering_3 ~ Datetime, col = 'Blue')
})
legend('topright', col = c('black', 'red', 'blue'), lty = 1, lwd = 2,
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

dev.copy(png, file = 'plot3.png', height = 480, width = 480)
dev.off()

