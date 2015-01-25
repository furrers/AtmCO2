---
title       : Mauna Loa Carbon Dioxide Records 
subtitle    : Explore interactively atmospheric carbon dioxide records at MLO, Hawaii
author      : 
job         : Course Project for Developing Data Products - Coursera Data Science Specialization
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Introduction

The Mauna Loa Carbon Dioxide Records tool aims to provide an interactive approach to explore the atmospheric carbon dioxide measurements at Mauna Loa Observatory (MLO), Hawaii. 

The carbon dioxide data, measured as the mole fraction in dry air, on Mauna Loa constitute the longest record of direct measurements of CO2 in the atmosphere. They were started by C. David Keeling of the Scripps Institution of Oceanography in March of 1958 at a facility of the National Oceanic and Atmospheric Administration (NOAA).

The tool accesses NOAA's data records [http://www.esrl.noaa.gov/gmd/obop/mlo/] for up-to-date monthly mean measurements and the Shiny Package for User Interface creation.

--- 

## Features and Future Potential

- Interactive tool to explore long term and seasonal changes in atmospheric CO2 at MLO
- Indication of measurement values as mouse-over tooltip
- Up-to-date, complete records up to last complete month
- Calculate increase in atmosperic CO2 for selected timeframe

---

## Approach

The application loads the most current NOAA MLO dataset on atmospheric carbon dioxide and converts the decimal date into date format.

```
##     Year decimal.date CO2.interpolated                Date
## 681 2014         2015            397.1 2014-11-16 09:00:00
## 682 2014         2015            398.8 2014-12-16 16:04:48
```
The slider input for the start of the time frame of interest is used to subset the complete dataset, present the data as a gvisLineChart and calculate the increase in atmospheric CO2.
```
data <- subset(mauna_loa, Year>=input$year)
paste(colMeans(matrix(tail(data$CO2.interpolated,n=12)))-colMeans(matrix(head(data$CO2.
                        interpolated,n=12))),'ppm',sep=' ')
```

---

## Future Potential and Packages used

* Include values from other stations to provide global comparison
* Include other measurement types, such as 
    + surface temperature
    + water temperature
    + ocean pH
* Expand scope to include glacial and sediment records

R Packages used:
- Shiny
- googleVis
- lubridate
- Slidify
