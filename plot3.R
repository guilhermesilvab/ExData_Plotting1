# Load data from file into memory, and select only the required rows (assuming that 
# the file "household_power_consumption.txt" is already in the current directory)
dat <- read.table("./household_power_consumption.txt", sep=";", head=TRUE, na.strings="?", stringsAsFactors=FALSE)
dat <- subset(dat, Date=="1/2/2007"|Date=="2/2/2007")

# Convert columns "Date" and "Time" in a  POSIXlt data type,
# and store the result in the "Date" column
dat$Date <- strptime(paste(dat$Date, dat$Time), format="%d/%m/%Y %H:%M:%S")

# Eliminate old "Time" column (this step is unnecessary for the assignment)
dat$Time <- NULL

#Plot 3
Sys.setlocale(category = "LC_ALL", locale = "en_US.UTF-8")

png(file = "plot3.png", height = 480, width = 480)
par(mfrow=c(1, 1), bg = "transparent")
plot(dat$Date, dat$Sub_metering_1, type="l", ylab="Energy sub metering", xlab = NA)
lines(dat$Date, dat$Sub_metering_2, type="l", col="red")
lines(dat$Date, dat$Sub_metering_3, type="l", col="blue")
legend("topright", lwd=1, col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
