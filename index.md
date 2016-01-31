---
title       : Prediction of CO2 emissions from waste and impact of recycling
subtitle    : A shiny application developed to estimate emissions based on household and recycling habits
author      : M L
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
mode        : standalone # {standalone, draft}
knit        : slidify::knit2slides
output: 
  html_document: 
    keep_md: yes
---

## Slide 2

### Introduction

The app here developed allows you to easily **calculate the CO2 emissions equivalent from waste production** per year, at the net of recycling habits. This is based on a part of the EPA model for calculation of individual emissions.  

### Inputs  

- **Number of people (household)**: enter the number of people in the household, which is a base for the estimation of emissions. 
 
- **Which items or products are usually recycled**: check the boxes corresponding to what is usually being recycled in the household. 

--- .class #id 

## Slide 3

### Model 

The model apply an average coefficient of C02 emission per year pro capite.
This is reduced by a coefficient for each of the products recycled.


```r
average_waste_emissions <- 692 # (Pounds of carbon dioxide equivalent/year)
print(average_waste_emissions)
```

```
## [1] 692
```

```r
# constant pro capite
metal_recycling_avoided_emissions<-(-89.38)
plastic_recycling_avoided_emissions<-(-35.56)
glass_recycling_avoided_emissions<-(-25.39)
newspaper_recycling_avoided_emissions<-(-113.14)
mag_recycling_avoided_emissions<-(-27.46)
```

--- .class #id 

## Slide 4

The calculation (actual part of a bigger model from EPA) is then a function based on the variables and our inputs.


```r
# id1 = number of people in household, recX = if a given material is recycled
totalWasteEmissions <- function(id1, rec1, rec2, rec3, rec4, rec5) {

  sum_temp<- id1*(average_waste_emissions +
  rec1*metal_recycling_avoided_emissions +
  rec2*plastic_recycling_avoided_emissions +  
  rec3*glass_recycling_avoided_emissions +
  rec4*newspaper_recycling_avoided_emissions +
  rec5*mag_recycling_avoided_emissions)
  
  if(sum_temp>0) sum_temp
  else 0
}
```

--- .class #id 

## Slide 5

### Notes  
Average lbs CO2 equivalent generated from waste per person per year	692	lbs CO2e/year/person from waste. 
Based on *EPA's Inventory of U.S. Greenhouse Gas Emissions and Sinks 1990-2011*,Chapter 8 (Waste), Table 8-3 and Chapter 3, Table 3-1, and *EPA's annual Municipal Solid Waste Characterization Report: Facts and Figures, 2011.*  
  For more details see:  
    http://www3.epa.gov/climatechange/ghgemissions/individual.html  
    https://github.com/0000m0000/co2app  


