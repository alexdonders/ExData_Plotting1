df = read.csv('household_power_consumption.txt', header = T, sep = ';', na.strings='?',
              nrows=2075259, check.names = FALSE, stringsAsFactors = FALSE, comment.char="", quote='\"')


sf = subset(df, Date %in% c('1/2/2007', '2/2/2007'))
sf$Date = as.Date(sf$Date, format='%d/%m/%Y')
datetime = paste(as.Date(sf$Date), sf$Time)
sf$Datetime = as.POSIXct(datetime)

############
# Plot 2

with(sf, 
     plot(Global_active_power ~ Datetime, 
          type = 'l',
          xlab = '',
          ylab = 'Global Active Power (kilowatts'
     )
)

dev.copy(png, file = 'plot2.png', height = 480, width = 480)
dev.off()


