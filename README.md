# Snowstorm-Classification
Snowstorm Classification using Machine Learning

**Description:**  The purpose of this project will be to classify snowstorms into a scale, similar to the scales used to classify tornadoes and hurricanes.  Currently, the only classification available for snowstorms is a binary option indicating if the parameters were met to categorize it as a blizzard.  Classification may reveal patterns that were previously unclear and allow weather professionals to adequately and accurately inform the public of potential dangers associated with the snowstorms.

**Data Science Task:**  The scale will be created utilizing classification using unsupervised learning algorithms.  This appears to be an appropriate technique due to the lack of any current rating system for snow storms.

**Data:**  Data is available through the National Oceanic and Atmospheric Administration’s National Centers for Environmental Information’s Storm Events Database and Snowstorm Database.  The Storm Events Database is a large dataset that will require filtering for the snowstorm data only.  The Snowstorm Database is a smaller dataset that contains approximately 500 storms since 1900.  Collection will be simple, as both databases are available for public download.  The available data should be a large enough dataset to properly classify snowstorms.

The Storm Events Database main page can be found here: https://www.ncdc.noaa.gov/stormevents/.  The dataset used in this project is the "StormEvents_details" including the years 1950 through the first four months of April.  These files can be found here https://www1.ncdc.noaa.gov/pub/data/swdi/stormevents/csvfiles/.  The files were downloaded, uncompressed using 7zip, and saved in a single location so that they could be appended in R.

The SnowStorm Database main page can be found here:  https://data.nodc.noaa.gov/cgi-bin/iso?id=gov.noaa.ncdc:C00464.  The files can be downloaded here:  https://www.ncei.noaa.gov/data/snowstorm-database/archive/.  Each of the files were downloaded, uncompressed using 7zip, and converted to a csv using MyGeoData: https://mygeodata.cloud/.  Additionally, only the highest snowfall total from each day of the storm was used in the calculations.

**Data Cleanup:** The Storm Events Database required merging all of the files together into a single dataset.  A subset of this dataset was created to include only EVENT_TYPE of: Blizzard, Frost/Freeze, Heavy Snow, Ice Storm, Lake-Effect Snow, Sleet, Winter Storm, and Winter Weather.  The new subset consisted of 238,782 rows of data.  

Columns that were not related to the scope of the project, contained all N/A's, or not necessary for the algorithm were removed (see Storms Events DS Column Removal document for more information).  Additionally, string and character values were converted to numeric values.  The Storm Events DS Cleanup R file was used to merge the files, remove columns, and convert values to numeric.

The summary function was used on the cleaned Storm Event dataset data to view basic information.
![StormEventDSSummary](https://github.com/wxwatchr/Snowstorm-Classification/blob/master/Graphics/StormEventsDSSummary.PNG)

All numeric values were plotted to see the variation in the fields.
![StormEventDSNumericValues](https://github.com/wxwatchr/Snowstorm-Classification/blob/master/Graphics/StormEventsDSNumericValues.PNG)

The SnowStorm Database required merging all of the converted files together into a single dataset.  Columns that were not related to the scope of the project or not necessary for the algorithm were removed (see SnowStorm DS Column Removal for more information).  

The start/begin dates were converted to a standardized date pattern.  Once the clean up was completed on both datasets, the two were merged together based on the start/begin date.

**Exploratory Data Analysis:** Additional exploratory data analysis was completed on the merged data sets.  This can be viewed in the SnowStormEDA.docx file.  The code is in the SnowEDA.r file.  

**Algorithm Analysis:** K-Means was used to group storms into clusters.  The optimal number of clusters was found to be 4.  With the Enhanced Fujita (tornado) scale as a model for this snowstorm scale, this number of clusters will fit the standard.  Classification was found to be 99.5%.  
![ResultsOne](https://github.com/wxwatchr/Snowstorm-Classification/blob/master/Graphics/analysis4.PNG)
![ResultsTwo](https://github.com/wxwatchr/Snowstorm-Classification/blob/master/Graphics/analysis4_2.PNG)

The silhouette method was used to visualize the groupings.
![SnowSilhouetteMethod](https://github.com/wxwatchr/Snowstorm-Classification/blob/master/Graphics/silhouette4.PNG)

**Conclusions:** K-Means clustering was an appropriate algorithm to create a scale for winter storms.  The first of the four categories contained a low number of storms.  This is likely due to human error in recording.  The smallest storms would not be recorded as true winter weather events.  Categories two and three contain the bulk of the storms that make up the average.  The fourth category also contains a small amount of storms.  This is similar to the Enhanced Fujita Scale's EF5 category and the Saffir-Simpson Scale's Category 5, most storms will not reach this level of intensity.

The scale for winter weather events allows media to present a storm's potential without the hype of the recent "Snowmaggedon" and "Snowpocalypse" namings.
