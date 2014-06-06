plot3<- function()
{
    tryCatch(
    {
      dev.off()
      print("OOPS..Open device is closed")
    },
    error=function(err) { 
    })
 
    ## read.csv.sql requires sqldf package which is performs SQL select on Data Frames.
    ## This helps in selective load of data based on some selection criteria    
    
    DataDf <- read.csv.sql("household_power_consumption.txt", 
                       sql = "select * from file where Date in ('1/2/2007','2/2/2007')",
                       header=TRUE,
                       sep=";"
    )                      

    ## Adding a new Variable which has both date and time components
    DataDf$Dtm <- strptime(paste(DataDf$Date,DataDf$Time,sep=" "), format='%d/%m/%Y %H:%M:%S')    

    png(filename = "plot3.png",width = 480, height = 480, units = "px", pointsize = 12,bg = "white")
    ylimits = range(c(df$Sub_metering_1, df$Sub_metering_2, df$Sub_meterng_3))
    plot(df$Dtm, df$Sub_metering_1, xlab = "Date", ylab = "Energy sub metering", type = "l", ylim = ylimits, col = "black")
    par(new = TRUE)
    plot(df$Dtm, df$Sub_metering_2, xlab = "", axes = FALSE, ylab = "", type = "l", ylim = ylimits, col = "red")
    par(new = TRUE)
    plot(df$Dtm, df$Sub_metering_3, xlab = "", axes = FALSE, ylab = "", type = "l", ylim = ylimits, col = "blue")
    legend("topright",
           legend = c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"),
           lty = c(1,1,1),           
           col = c("black", "red", "blue"))
       dev.off()
}

