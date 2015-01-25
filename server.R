library(googleVis)
library(shiny)
library(lubridate)

mauna_loa <- read.table("ftp://aftp.cmdl.noaa.gov/products/trends/co2/co2_mm_mlo.txt", skip=72, sep="", header=FALSE)
names(mauna_loa) <- c("Year","Month","decimal.date","CO2.average","CO2.interpolated","CO2.trend","no.days")
mauna_loa$Date <- date_decimal(mauna_loa$decimal.date)

shinyServer(function(input, output) {
    myYear <- reactive({
        input$year
    })
    
    output$view <- renderGvis({
        data <- subset(mauna_loa, Year>=input$year)
        gvisLineChart(data, xvar="Date", yvar="CO2.interpolated",
                      options=list(title="Monthly Mean Atmospheric CO2 at Mauna Loa, Hawaii", legend="bottom",
                                   titleTextStyle="{color:'blue', fontSize:14}",
                                   vAxis="{title:'CO2 Parts per Million', titleTextStyle:{color:'grey'},gridlines:{color:'blue', count:10}}",
                                   hAxis="{title:'Year', titleTextStyle:{color:'grey'}}",width=700, height=500))
   })
   
   output$diff <- renderPrint({
       data <- subset(mauna_loa, Year>=input$year)
       paste(format(round(colMeans(matrix(tail(data$CO2.interpolated,n=12)))-colMeans(matrix(head(data$CO2.interpolated,n=12))), 1), nsmall = 1),'ppm',sep=' ')})
})