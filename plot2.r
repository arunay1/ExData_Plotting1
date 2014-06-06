plot2<- function()
{
    tryCatch(
    {
      dev.off()
    },
    error=function(err) { 
        print("oops")
    })

    ## read.csv.sql requires sqldf package which is performs SQL select on Data Frames.
    ## This helps in selective load of data based on some selection criteria   
    DataDf <- read.csv.sql("household_power_consumption.txt", 
                       sql = "select * from file where Date in ('1/2/2007','2/2/2007')",
                       header=TRUE,
                       sep=";"
                       )         
    ## Adding a new Variable which has both date and time components.
    DataDf$Dtm <- strptime(paste(DataDf$Date,DataDf$Time,sep=" "), format='%d/%m/%Y %H:%M:%S')    

    png(filename = "plot2.png",width = 480, height = 480, units = "px", pointsize = 12,bg = "white")
    plot(df$Dtm, df$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")    
    dev.off()
}

