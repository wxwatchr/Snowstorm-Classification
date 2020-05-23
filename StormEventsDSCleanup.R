library(dplyr)

## set working directory
setwd("D:/Documents/classes/Capstone_Data/")

## obtain filenames and full path to files
filenames <- list.files(path="D:/Documents/classes/Capstone_Data/",pattern="*.csv")
fullpath = file.path("D:/Documents/classes/Capstone_Data", filenames)

## create dataset by merging all files in the location
data <- do.call("rbind",lapply(filenames,FUN=function(files){ read.csv(files)}))

## view dataset to verify merge successful
head(data)

## view summary of data
summary(data)

## create new dataset with only snow related data
snow_dataset <- subset(snow_data, snow_data$EVENT_TYPE == "Blizzard" | snow_data$EVENT_TYPE =="Frost/Freeze" | snow_data$EVENT_TYPE =="Heavy Snow" | snow_data$EVENT_TYPE =="Ice Storm" | snow_data$EVENT_TYPE =="Lake-Effect Snow" | snow_data$EVENT_TYPE =="Sleet" | snow_data$EVENT_TYPE =="Winter Storm" | snow_data$EVENT_TYPE =="Winter Weather", select = BEGIN_YEARMONTH:DATA_SOURCE)

## view number of winter weather related events
nrow(snow_dataset)

## view summary of winter weather dataset
summary(snow_dataset)

## drop columns that are not useful for project
drop <- c("STATE_FIPS", "CZ_FIPS", "CZ_NAME", "SOURCE", "FLOOD_CAUSE", "CATEGORY", "TOR_F_SCALE", "TOR_LENGTH", "TOR_WIDTH", "TOR_OTHER_WFO", "TOR_OTHER_CZ_STATE", "TOR_OTHER_CZ_FIPS", "TOR_OTHER_CZ_NAME", "BEGIN_AZIMUTH", "END_AZIMUTH", "DATA_SOURCE", "BEGIN_RANGE", "END_RANGE", "EPISODE_NARRATIVE", "EVENT_NARRATIVE", "MAGNITUDE", "MAGNITUDE_TYPE", "BEGIN_LAT", "BEGIN_LON", "END_LAT", "END_LON", "EPISODE_ID", "EVENT_ID")
snow_clean = snow_dataset[,!(names(snow_dataset) %in% drop)]

## view summary of clean data
summary(snow_clean)

## convert states to numeric values
snow_clean$STATE = recode(snow_clean$STATE, "ALABAMA"=1, "ALASKA"=2, "ARIZONA"=3, "ARKANSAS"=4, "CALIFORNIA"=5, "COLORADO"=6, "CONNECTICUT"=7, "DELAWARE"=8, "FLORIDA"=9, "GEORGIA"=10, "HAWAII"=11, "IDAHO"=12, "ILLINOIS"=13, "INDIANA"=14, "IOWA"=15, "KANSAS"=16, "KENTUCKY"=17, "LOUISIANA"=18, "MAINE"=19, "MARYLAND"=20, "MASSACHUSETTS"=21, "MICHIGAN"=22, "MINNESOTA"=23, "MISSISSIPPI"=24, "MISSOURI"=25, "MONTANA"=26, "NEBRASKA"=27, "NEVADA"=28, "NEW HAMPSHIRE"=29, "NEW JERSEY"=30, "NEW MEXICO"=31, "NEW YORK"=32, "NORTH CAROLINA"=33, "NORTH DAKOTA"=34, "OHIO"=35, "OKLAHOMA"=36, "OREGON"=37, "PENNSYLVANIA"=38, "RHODE ISLAND"=39, "SOUTH CAROLINA"=40, "SOUTH DAKOTA"=41, "TENNESSEE"=42, "TEXAS"=43, "UTAH"=44, "VERMONT"=45, "VIRGINIA"=46, "WASHINGTON"=47, "WEST VIRGINIA"=48, "WISCONSIN"=49, "WYOMING"=50)

## convert month_name to numeric values
snow_clean$MONTH_NAME = recode(snow_clean$MONTH_NAME, "January"=1, "February"=2, "March"=3, "April"=4, "May"=5, "June"=6, "July"=7, "August"=8, "September"=9, "October"=10, "November"=11, "December"=12)

## convert event_type to numeric values
snow_clean$EVENT_TYPE = recode(snow_clean$EVENT_TYPE, "Blizzard"=1, "Frost/Freeze"=2, "Heavy Snow"=3, "Ice Storm"=4, "Lake-Effect Snow"=5, "Sleet"=6, "Winter Storm"=7, "Winter Weather"=8)

## convert cz-type to numeric values
snow_clean$CZ_TYPE = recode(snow_clean$CZ_TYPE, "C"=1, "Z"=2, "M"=3)

