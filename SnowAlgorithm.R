## change int values to numeric
snow$BEGIN_YEARMONTH <- as.numeric(snow$BEGIN_YEARMONTH)
snow$BEGIN_DAY <- as.numeric(snow$BEGIN_DAY)
snow$BEGIN_TIME <- as.numeric(snow$BEGIN_TIME)
snow$END_YEARMONTH <- as.numeric(snow$END_YEARMONTH)
snow$END_DAY <- as.numeric(snow$END_DAY)
snow$END_TIME <- as.numeric(snow$END_TIME)
snow$INJURIES_DIRECT <- as.numeric(snow$INJURIES_DIRECT)
snow$INJURIES_INDIRECT <- as.numeric(snow$INJURIES_INDIRECT)
snow$DEATHS_DIRECT <- as.numeric(snow$DEATHS_DIRECT)
snow$DEATHS_INDIRECT <- as.numeric(snow$DEATHS_INDIRECT)
snow$DAMAGE_PROPERTY <- as.numeric(snow$DAMAGE_PROPERTY)
snow$d10 <- as.numeric(snow$d10)

## change character values to numeric
snow$DAMAGE_CROPS <- as.numeric(as.character(snow$DAMAGE_CROPS))

## remove WFO (character), BEGIN_LOCATION, END_LOCATION, and CZ_TIMEZONE
snow$WFO <- NULL
snow$BEGIN_LOCATION <- NULL
snow$END_LOCATION <- NULL
snow$CZ_TIMEZONE <- NULL

## remove END_DATE_TIME (END_DATE will be used instead)
snow$END_DATE_TIME <- NULL

## remove BEGIN_YEARMONTH (MONTH will be used instead)
snow$BEGIN_YEARMONTH <- NULL

## remove END_YEARMONTH (MONTH will be used instead)
snow$END_YEARMONTH <- NULL

## remove YEAR
snow$YEAR <- NULL

## remove BEGIN_DAY and BEGIN_TIME 
snow$BEGIN_DAY <- NULL
snow$BEGIN_TIME <- NULL

## remove END_DAY and END_TIME
snow$END_DAY <- NULL
snow$END_TIME <- NULL

## change NA values to 0
snow[is.na(snow)] <- 0

##import libraries
library(stats)
library(cluster)
library(factoextra)

## set seed
set.seed(1234)

## split data into training and test
ind <- sample(2,nrow(snow),replace=TRUE,prob=c(0.80,0.20))

## create training and test subsets
snow_training <- snow[ind==1,2:21]
snow_test <- snow[ind==2,2:21]

## apply k-means algorithm with 6 clusters (6 chosen to match current weather scales - 99.6%)
scale_index <- kmeans(snow[,2:21], 4)

## create column with the scale_index
snow$scale_index <- as.factor(scale_index$cluster)

## view scale_index values
str(snow)

## plot scale_index values
plotScale <- table(snow$scale_index)
barplot(plotScale, main="Winter Storm Scale",
        xlab="Scale", ylab="Number of Occurences", col=c("blue"))

## Silhouette method 
snowSil <- silhouette(scale_index$cluster, dist(snow))
fviz_silhouette(snowSil)