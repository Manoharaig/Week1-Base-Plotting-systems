# plot1.R

library(dplyr)
library(utils)
library(data.table)
library(ggplot2)
library(grid)
library(grDevices)

dir <- "\\\\pngscitrix02/mmallesh/My Documents/data/household_power_consumption.txt"
house_pwr_consumption<- read.table (dir, header = TRUE, sep = ";", na.strings = "?")

str(house_pwr_consumption)

data <- house_pwr_consumption %>%
             filter(Date %in% c("1/2/2007", "2/2/2007"))

plot1 <- data$Global_active_power
hist(plot1, xlab = "Global Active Power (Kilowatts)", main = "Global Active Power", col = "Red")

dev.copy(png, "plot1.png")
dev.print(width = 480, height = 480)
dev.off()











