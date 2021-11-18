library('data.table')
library(tidyverse)

bus_dataset <- fread('http://bit.ly/BusNairobiWesternTransport')


buses2 <- read.csv('/Users/RyanMburu/Documents/R/week1/buses.csv')
head(buses2)

buses3 <- read.csv('~/Documents/R/week1/buses.csv')
head(buses3)



library(curl)

myfile <- getURL('http://bit.ly/BusNairobiWesternTransport', ssl.verifyhost=FALSE, ssl.verifypeer=FALSE)
head(myfile)
