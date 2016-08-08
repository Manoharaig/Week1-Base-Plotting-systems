# plot3.R

library(dplyr)
library(utils)
library(data.table)
library(ggplot2)
library(grid)
library(grDevices)
library(graphics)


dir <- "\\\\pngscitrix02/mmallesh/My Documents/data/household_power_consumption.txt"
house_pwr_consumption<- read.table (dir, header = TRUE, sep = ";", na.strings = "?")

str(house_pwr_consumption)

data <- house_pwr_consumption %>%
             filter(Date %in% c("1/2/2007", "2/2/2007"))
data$Datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

str(data)
x <- data$Datetime
y <- data$Sub_metering_1
z <- data$Sub_metering_2
w <- data$Sub_metering_3


plot(x, y, type = "l", xlab = "", ylab = "Energy sub metering", ylim = c(0, 38))  
par(new = T)
plot(x, z, type = "l", xlab = "", ylab = "Energy sub metering", ylim = c(0, 38), col = "Red")
par(new = T)
plot(x, w, type = "l", xlab = "", ylab = "Energy sub metering", ylim = c(0, 38), col = "Blue")
par(new = T)
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, lwd = 2, col = c("black", "red", "blue"))


dev.copy(png, "plot31.png")
dev.print(width = 480, height = 480)
dev.off()











