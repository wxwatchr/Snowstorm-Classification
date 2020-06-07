## plot event type by state
ggplot(data=snow,aes(x=reorder(STATE,EVENT_TYPE),y=EVENT_TYPE)) + 
  geom_bar(stat ='identity',aes(fill=EVENT_TYPE))+
  coord_flip() + 
  theme_grey() + 
  scale_fill_gradient(name="Event Types by State")+
  labs(title = 'Event Type by State',
       y='Event Type',x='State')+ 
  geom_hline(yintercept = mean(snow$EVENT_TYPE),size = 1, color = 'blue')

## plot Event Types by Year
plotOne <- table(snow$EVENT_TYPE, snow$YEAR)
barplot(plotOne, main="Event Type by Year",
        xlab="Year", col=c("darkblue","red"),
        legend = rownames(snow$EVENT_TYPE))

## plot d1 by Year
plotTwo <- table(snow$d1, snow$YEAR)
barplot(plotTwo, main="Day One Snow Totals by Year",
        xlab="Year", col=c("darkblue","red"),
        legend = rownames(snow$d1))

## plot d1 snow totals
plotThree <- table(snow$d1)
barplot(plotThree, main="Day One Snow Totals",
        xlab="d1", col=c("blue"))

## plot d2 snow totals
plotFour <- table(snow$d2)
barplot(plotFour, main="Day Two Snow Totals",
        xlab="d2", col=c("red"))

## plot d3 snow totals
plotFive <- table(snow$d3)
barplot(plotFive, main="Day Three Snow Totals",
        xlab="d3", col=c("blue"))

## plot d4 snow totals
plotSix <- table(snow$d4)
barplot(plotSix, main="Day Four Snow Totals",
        xlab="d4", col=c("red"))

## plot d5 snow totals
plotSeven <- table(snow$d5)
barplot(plotSeven, main="Day Five Snow Totals",
        xlab="d5", col=c("blue"))

## plot d6 snow totals
plotEight <- table(snow$d6)
barplot(plotEight, main="Day Six Snow Totals",
        xlab="d6", col=c("red"))

## plot d7 snow totals
plotNine <- table(snow$d7)
barplot(plotNine, main="Day Seven Snow Totals",
        xlab="d7", col=c("blue"))

## plot d8 snow totals
plotTen <- table(snow$d8)
barplot(plotTen, main="Day Eight Snow Totals",
        xlab="d8", col=c("red"))

## plot d9 snow totals
plotEleven <- table(snow$d9)
barplot(plotEleven, main="Day Nine Snow Totals",
        xlab="d9", col=c("blue"))

## plot d10 snow totals
plotTwelve <- table(snow$d10)
barplot(plotTwelve, main="Day Ten Snow Totals",
        xlab="d10", col=c("red"))
