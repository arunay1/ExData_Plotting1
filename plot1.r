plot1<- function()
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
    library(sqldf)
    DataDf <- read.csv.sql("household_power_consumption.txt", 
                       sql = "select * from file where Date in ('1/2/2007','2/2/2007')",
                       header=TRUE,
                       sep=";"
                       )
                       
    DataDf$Dtm <- strptime(paste(DataDf$Date,DataDf$Time,sep=" "), format='%d/%m/%Y %H:%M:%S')    

    png(filename = "plot1.png",width = 480, height = 480, units = "px", pointsize = 12,bg = "white")
    hist(DataDf$Global_active_power,col="red",main="Histogram of Global Active Power",xlab="Global Active Power(kilowatts)")
    dev.off()    
}

