# Snowstorm-Classification
Snowstorm Classification using Machine Learning

**Description:**  The purpose of this project will be to classify snowstorms into a scale, similar to the scales used to classify tornadoes and hurricanes.  Currently, the only classification available for snowstorms is a binary option indicating if the parameters were met to categorize it as a blizzard.  Classification may reveal patterns that were previously unclear and allow weather professionals to adequately and accurately inform the public of potential dangers associated with the snowstorms.

**Data Science Task:**  The scale will be created utilizing classification using unsupervised learning algorithms.  This appears to be an appropriate technique due to the lack of any current rating system for snow storms.

**Data:**  Data is available through the National Oceanic and Atmospheric Administration’s National Centers for Environmental Information’s Storm Events Database and Snowstorm Database.  The Storm Events Database is a large dataset that will require filtering for the snowstorm data only.  The Snowstorm Database is a smaller dataset that contains approximately 500 storms since 1900.  Collection will be simple, as both databases are available for public download.  The available data should be a large enough dataset to properly classify snowstorms.

The Storm Events Database main page can be found here: https://www.ncdc.noaa.gov/stormevents/.  The dataset used in this project is the "StormEvents_details" including the years 1950 through the first four months of April.  These files can be found here https://www1.ncdc.noaa.gov/pub/data/swdi/stormevents/csvfiles/.  The files were downloaded, uncompressed using 7zip, and saved in a single location so that they could be appended in R.
