# Automated Pollution Monitoring

## Principal Agent Problem



<html>
<head>
<style>
code {
  background-color: #f1f1f1;
}
</style>
</head>
<body>

In economics and political science, there is a concept known as the **principal agent problem**. This setting arises when there is an agent that is making decisions on behalf of a principal, but the agent and the principal's incentives may not align. 

A classic example is employees at a firm. The employee is putting in some amount of effort to produce some output for the firm owner. The firm owner may want to produce as much output as possible, but the employee may balance output with the amount of effort it takes to produce that output. Therefore, their incentives do not necessarily align. 

Another classic example is elected officials and the citizenry. The officials make decisions (i.e. the agents) acting on behalf of the citizens (i.e. the principal). However, the goal of the elected officials may be to be re-elected, not necessarily make the optimal decisions for the citizens. Therefore, in this setting as well, it is possible that the incentives are not necessarily aligned between the agent and the principal. 

In this section, we will be discussing an interesting setting in which the principal agent problem is at play. In China, the central government (the principal) has recently made it a priority to reduce air pollution in China. To accomplish this, they provide high-power incentives to local governments (the agent) that achieve pollution targets. However, the local government officials are also the ones collecting the pollution data. While it may be costly to reduce air pollution, one possibility is that they can cheat and report pollution numbers lower than the actual pollution level.

Greenstone et al. (2022)[@greenstone2022can] studies this question by examining the introduction of automatic air pollution monitoring in China. This automated system was implemented in order to get accurate measures of pollution that cannot be manipulated by local officials. There are basically two potential outcomes of this analysis. First, local officials were reporting accurate numbers. In this case, we wouldn't expect automatic monitoring to change reported pollution numbers. The numbers are accurate both before and after the policy, and therefore, we expect the levels to be similar both before and after the policy. 

The second possibility is that reported levels of pollution increase after automatic monitoring. If this is the case, then it suggests local governments were misreporting before automatic monitoring so that it would appear as if they are meeting pollution targets. 
  
In order to measure pollution we will use reported PM10. This is a measure of particulates in the air that are 10 micrometers in diameter or smaller, and a common metric through which to measure air pollution. The focus of our coding this week will be on creating figures in R. We will create figures in both base R, as well as utilizing a popular graphics package, ggplot2. In the end, we will use our figures to understand whether local officials misreported pollution data in China. 

## Creating Histograms

In this section, we are going to learn how to construct histograms in base R. To begin, we first need to load the data frame. However, the data we will be using ``station_day_1116.dta`` is a Stata dataset. In the past, we have only loaded in either RData or csv files.

In order to load in a Stata data set we are going to make use of the ``haven`` package. In order to install the haven package, you need to execute ``install.packages("haven")``. Then, in your current R session you need to load the package using the ``library()`` function. Since we will again be utilizing the tidyverse in this section, we will also load the tidyverse package.


```r
library(haven)
library(tidyverse)
── Attaching packages ─────────────────── tidyverse 1.3.1 ──
✓ ggplot2 3.3.5     ✓ purrr   0.3.4
✓ tibble  3.1.4     ✓ dplyr   1.0.7
✓ tidyr   1.1.4     ✓ stringr 1.4.0
✓ readr   2.0.1     ✓ forcats 0.5.1
── Conflicts ────────────────────── tidyverse_conflicts() ──
x dplyr::filter() masks stats::filter()
x dplyr::lag()    masks stats::lag()
```

The ``haven`` package comes with a function ``read_dta``, which will read in a ``.dta`` file as a tibble.


```r
pm <- read_dta("station_day_1116.dta")
```

To first get a sense of our data, let's look at a few of the key variables in this dataset. 


```r
pm %>% head(pm10_n,code_city, date, pm10, auto_date)
Error in checkHT(n, d <- dim(x)): object 'pm10_n' not found
```

The first variable, ``pm10_n`` is the station number. This is the code of the station that took the pollution reading. The next variable ``code_city`` is the code of the city in which the pollution reading was taken. This dataset is a panel dataset, which means there are many observations over time. In this case, we will have readings from the same pollution center over time. The ``date`` variable stores information on the date the reading was taken. We will discuss a bit later what the number in this variable means. ``pm10`` is our measure of pollution. Lastly, ``auto_date`` is the date of automation. After this date, instead of local governments reporting pollution statistics, pollution statistics were directly reported to the central government.

So for this section our goal is to create a histogram that shows the distribution of ``pm10`` across cities. Right now, we have a dataset that is at the station-date level. Each row corresponds to a pollution level at a particular station. We want to transform our data into a dataset that has for every city, the average level of pollution in that city. 

The way we can do this is to use ``group_by()`` and ``summarize()``, as we did in the prior chapter. If you recall, when you want to create a tibble of summary statistics by a group, we use ``group_by()`` in combination with ``summarize()``. In this example, the group variable is the ``code_city`` and the summary statistic is the average level of ``pm10``.


```r
pm_bycity <- pm %>%
  group_by(code_city) %>%
  summarize(meanpm10 = mean(pm10, na.rm=T))
```

We have included ``na.rm=T``, because looking through the ``pm10`` variable, it appears there is some missing data. Adding ``na.rm=T`` indicates we are taking the average over the non-missing values.

So now, for each unique value of ``code_city``, we have the average of the PM10 level in that city. This is the dataset that we will use in order to generate our histogram.

To generate histograms in base R, we can use the ``hist()`` function. For example, let's generate a histogram of ``pm10``:


```r
hist(pm_bycity$meanpm10)
```

<div class="figure" style="text-align: center">
<img src="08-week8_files/figure-html/hist1-1.png" alt="Histogram of Average Pollution Levels Across Cities Part 1" width="90%" />
<p class="caption">(\#fig:hist1)Histogram of Average Pollution Levels Across Cities Part 1</p>
</div>

First, let's review a histogram. On the horizontal axis, we have our numeric variable ``meanpm10``, which is the average level of ``pm10``. The histogram has binned this variable into discrete intervals. R automatically creates these bins when you use the ``hist()`` function. Then, in the vertical axis, the number of cities that fall within that interval is presented. So, for example, if we look at the tallest bin, which is about 80-100, we can see there are about 35 cities with average pollution in that range.

While this presents our information, there is a lot we can do in order to improve this figure. For example, the title right now is not clear. A reader may not know what ``pm_bycity$meanpm10`` means. As usual, we will want to improve these labels. 

To change the axis labels, we can use ``xlab="Horizontal Axis Name"`` and ``ylab="Vertical Axis Name"``. To add a title, we can use ``main="Title Name"``. ``main`` is perhaps not the most intuitive name for the options that generates a title, but you can think of it is "What is the main subject for this plot". So let's try to re-create our plot with better axes labels and titles.


```r
hist(pm_bycity$meanpm10, 
     xlab="Mean PM10", 
     ylab="Frequency", 
     main="Mean PM10 by City")
```


<div class="figure" style="text-align: center">
<img src="08-week8_files/figure-html/hist2-1.png" alt="Histogram of Average Pollution Levels Across Cities Part 2" width="90%" />
<p class="caption">(\#fig:hist2)Histogram of Average Pollution Levels Across Cities Part 2</p>
</div>

These various options will be useful for many different types of graphs in base R, not just histograms. For example, later we will generate a scatter plot. We can use these same options when generating this alternate type of graph. 

Next, let's discuss ways in which we can customize the look of our plot. For example, with histograms, one common way to customize the plot is to change the number of bins that are created. R chooses a default number of bins, but you can manually change this by using the ``breaks`` option. If you specify a higher number for ``breaks``, that means you want more bins. If you specify a lower number, that means you want fewer bins.

To illustrate this, we are going to put two plots side-by-side. Learning how to put two plots side-by-side is a generally useful technique as well. Often in academic articles, you might see multiple panels in a figure if the information between the panels is closely related. In our example, we are going to create two plots, one with many bins and another with few bins. 

The way to tell R to create multiple plots is to use the function called ``par()``. Within ``par()`` you can use an argument called ``mfrow=``. ``mfrow=`` tells R how many rows and how many columns you want in your plot. For example, in our example, we want on a single row, two separate figures. You can think of this as a row of figures, but two columns of figures. To specify this in R, you can type ``mfrow=c(1,2)``.


```r
par(mfrow=c(1,2))

#Smaller bins
hist(pm_bycity$meanpm10, xlab="Mean PM10", 
     ylab="Frequency", main="Mean PM10 by City",
     breaks=20)

#Larger bins
hist(pm_bycity$meanpm10, xlab="Mean PM10", 
     ylab="Frequency", main="Mean PM10 by City",
     breaks=4)
```


<div class="figure" style="text-align: center">
<img src="08-week8_files/figure-html/hist3-1.png" alt="Histogram of Average Pollution Levels Across Cities Part 3" width="90%" />
<p class="caption">(\#fig:hist3)Histogram of Average Pollution Levels Across Cities Part 3</p>
</div>

As you can see, when we specify ``breaks=20``, the histogram function generates many bins. When we specified ``breaks=4``, we retrieve only 4 bins.

So generally there is a trade off in the number of bins you create. In the left plot, we get more fine-grained information about the distribution of ``pm10`` across cities. On the right, the information is more aggregated, but perhaps easier to read. In many cases, the default number of bins is a good choice.

## Comparing Histograms

In this section we will discuss how to compare two histograms. In particular, we will plot this distribution of pollution levels (PM10) both before and after the implementation of automatic monitory. 

Before we construct these histograms, we need to compute a data frame that contains average pollution levels by city, both before and after automation. We can accomplish this by first constructing a variable ``T`` that contains days until automation. Then we can filter to days before automation (``T<0``). Similarly, we can create a post-automation data frame by filtering to observations such that ``T>0``. We can accomplish all of this in one step by using the pipe operator:


```r
pm_bycitybefore <- pm %>%
  mutate(T=date-auto_date) %>%
  filter(T<0) %>%
  group_by(code_city) %>%
  summarize(meanpm10 = mean(pm10, na.rm=TRUE))
```

So let's make sure we understand each line of code. ``pm %>%`` pipes in the data frame ``pm``. ``mutate(T=date-auto_date)`` creates a new variable and its it to the data frame. The name of this new variable is ``T``. If ``T`` is negative, that means ``date`` is less than ``auto_date``. Next ``filter(T<0)`` implies we are restricting to observations before the automation date. Lastly, `` group_by(code_city) %>% summarize(meanpm10=mean(pm10, na.rm=T))`` implies we are taking averages of ``pm10`` by city. In the end, we will have a dataset where each observation is a separate city, and we have the average level of ``pm10`` in that city before automation. We can use analogous code to construct a city-level dataset that has the average level of ``pm10`` after automation.


```r
pm_bycityafter <- pm %>% 
  mutate(T=date-auto_date) %>%
  filter(T > 0) %>%
   group_by(code_city) %>%
  summarize(meanpm10 = mean(pm10, na.rm=TRUE))
```

Next, we will create two plots that lie side-by-side. In order to do this, we will again specify ``par(mfrow=c(1,2))`` before generating the plots.


```r
par(mfrow=c(1,2))

#Plot histogram for before
hist(pm_bycitybefore$meanpm10, xlab="MeanPM10", 
  ylab="Frequency",
  main="Before Automation")

#Plot histogram for after
hist(pm_bycityafter$meanpm10, xlab="MeanPM10", 
  ylab="Frequency",
  main="After Automation")
```

<img src="08-week8_files/figure-html/unnamed-chunk-10-1.png" width="90%" />

In these plots it is not so easy to compare the two distributions. One reason is that they are not on the same scale. As you can see, the x-axis in the After Automation plot goes up to 200, while in the Before Automation plot it goes up to 150. In order for the two to be directly comparable, we should ensure that both the x-axis and the y-axis have the same scale. We can do this using the ``xlim()`` and ``ylim()`` functions. 


```r
#Create two panes for plots
par(mfrow=c(1,2))
#Plot histogram for before
hist(pm_bycitybefore$meanpm10, xlab="MeanPM10", 
  ylab="Frequency",
  main="Before automation",
  xlim=c(0,250), ylim=c(0,50))
#Plot histogram for after
hist(pm_bycityafter$meanpm10, xlab="MeanPM10", 
  ylab="Frequency",
  main="After automation",
  xlim=c(0,250), ylim=c(0,50))
```

<img src="08-week8_files/figure-html/unnamed-chunk-11-1.png" width="90%" />

Now we can more clearly compare the two plots. Before automation, many of the pm10 averages seem to be clustered just below 100. After automation, the distribution is more sspread out, with many observations above 100, and even some above 200. Before automation, no city had an average level of pm10 above 200. Therefore, it appears as if the distribution of **reported** pm10 has shifted to the right after automation.

Lastly, we can also add additional information to the plot. For example, it might be helpful to quickly be able to understand how the average level of pm10 varies before and after automation. We can add these numbers to the plots by using the ``lines()`` function. The way the lines function works is that you specify $(x_1, x_2)$ and $(y_1,y_2)$. The line starts at the point $(x_1,y_1)$ and ends at $(x_2,y_2)$. Therefore, if we want to have a vertical line at the mean we can specify ``lines(c(mean,mean),c(-10,100))``. We have specified ``c(-10,100)`` because these numbers are beyond the limits of the graph. Therefore, the vertical line will appear along the entire graph output. To understand how to build lines on graphs, it is helpful to change the numbers in the code below and see how the results change.


```r
meanbefore <- mean(pm_bycitybefore$meanpm10)
meanafter <- mean(pm_bycityafter$meanpm10)
#Create two panes for plots
par(mfrow=c(1,2))
#Plot histogram for before
hist(pm_bycitybefore$meanpm10, xlab="MeanPM10",
  ylab="Frequency",
  main="Before Automation",
  xlim=c(0,250), ylim=c(0,50))
lines(c(meanbefore, meanbefore), c(-10, 100), 
  lty=2, col="red")
#Plot histogram for after
hist(pm_bycityafter$meanpm10, xlab="MeanPM10", 
  ylab="Frequency",
  main="After Automation",
  xlim=c(0,250), ylim=c(0,50))
lines(c(meanafter, meanafter), c(-10, 100), 
  lty=2, col="red")
```

<img src="08-week8_files/figure-html/unnamed-chunk-12-1.png" width="672" />

## Boxplots

A box plot is a figure we have not yet seen in this course. Like a histogram, it is informative about the distribution of a variable. In particular, a box plot shows a few key statistics of interest, including the median, the 25th precentile and 75th percentile. It is often helpful when you want to show how the distribution of a variable varies across different groups. For example, maybe you are interested in variation in test scores across different classes in a school. Maybe you are interested in how the distribution of wages across different regions of the U.S. In these types of instances, box plots might be an effective way to present your information. 

In our example, we are going to construct a box plot that shows the average daily pm10 levels both before and after automation. To begin, we are again going to use ``group_by()`` and ``summarize()`` to construct a relevant dataset. 


```r
#Group by day
pm_byday <- pm %>% 
  mutate(
    T=date-auto_date) %>%
  filter(T>-364, T<364) %>%
  group_by(T) %>%
  summarize(meanpm10 = mean(pm10, na.rm=TRUE))
```

So in this example, ``T`` is again the days until automation. For this box plot, we are restricting to within a year of the automation date ``filter(T>-364, T<364)``. Because we have grouped by ``T``, our resulting dataset will have a single observation per day, with the corresponding variable being the average level of pollution on that day. To construct a box plot we can use the ``boxplot()`` function:


```r
boxplot(pm_byday$meanpm10)
```

<img src="08-week8_files/figure-html/unnamed-chunk-14-1.png" width="85%" />

The box plot has a few elements that we should discuss. First, the upper end of the box is the 75th percentile (also referred to as the third quartile). In this box plot, the 75th percentile is at about 112. The bottom of the box is the 25th percentile (also referred to as the 1st quartile). In this box plot, the 25th percentile is about 80. The length of the box is referred to as the interquartile range. This is the difference between the 75th percentile and the 25th percentile, so in this example the interquartile range is 112-80=32.

The dashed lines that extend from the box are referred to as whiskers. The length of the whiskers is equal to $1.5 \cdot IQR$. So in this example, the whiskers extend for about $32 \cdot 1.5 = 48$. However, the whiskers only extend this length as long as there is data in that range. For example, theoretically, the bottom whisker should extend to $80-48=32$. The reason it does not in the figure is because there is no data at this point. Instead, the whisker extends to the minimum, which is about 53 in this figure. 

As you can see, the upper whisker is longer and extends to $112+48=160$. Further, we can see there are dots beyond the whisker. This signifies that there is data beyond the values reached by the whisker. These dots give us a sense of how many outliers there are in the data. 

Just as in other figures, we can also improve the aesthetics of the box plot in various ways. For example, the box plot below adds appropriate labels, changes teh colors of the box plot, as well as changes the orientation of the box plot.


```r
boxplot(pm_byday$meanpm10, xlab="Mean PM10", 
main="Mean PM 10 by city",
  col="blue", border="darkblue", 
  pch=16, horizontal=T)
```

<img src="08-week8_files/figure-html/unnamed-chunk-15-1.png" width="75%" />

It is actually relatively uncommon to see a single box plot. What is often useful, however, is to display box plots across different groups. Therefore, in the next figure we will have separate box plots for before and after automation.

First, we need to add a variable that indicates whether the time is before or after automation. 


```r
pm_byday$after <- pm_byday$T>0
```

To plot separate box plots by the value of ``after``, we specify ``pm_byday$meanpm10 ~ pm_byday$after`` inside the boxplot function, rather than just ``pm_byday$meanpm10``.


```r
boxplot(pm_byday$meanpm10 ~ pm_byday$after, 
        xlab="Mean PM10", ylab="After Automation",
        main="Mean PM 10 by Day Before and After Automation", 
        col="blue", border="darkblue", 
        pch=16, horizontal=T)
```

<img src="08-week8_files/figure-html/unnamed-chunk-17-1.png" width="75%" />

What can we tell from this figure? Well, after automation pollution levels seem to be higher. The 25th percentile, median, and 75th percentile are all higher. Additionally, the minimum and maximum levels have also shifted dramatically. Before, the minimum pollution level was around 53, while after it is closer to 75. Before, the maximum level topped out just below 140. After we have a day with pollution levels at almost 200. It appears there is a large increase in reported pollution levels after automation, providing evidence that local governments under-reported pollution levels before automatic monitoring. 

## Scatterplots

In this section we will analyze how pollution changes day-to-day around automation. In order to do this, we will plot daily pollution levels around the time of automation. Therefore, we will continue to use the data set ``pm_byday`` which includes average pollution levels across cities every day within a year of automated pollution monitoring 

The general syntax for a scatterplot is:

```r
plot(df$xvar, df$yvar)
```

We want a plot in which the x-axis depicts the day relative to automation while y-axis depicts average pollution levels. Therefore, we will replace ``df$xvar`` with ``pm_bydat$T`` and ``df$yvar`` with ``pm_byday$meanpm10``. As in other plots we will add labels to clarify the plot.


```r
plot(pm_byday$T, pm_byday$meanpm10,
    xlab="Days Relative to Automation",
    ylab="Mean PM10", 
    main="Automation and Mean PM10",)
```

<img src="08-week8_files/figure-html/unnamed-chunk-19-1.png" width="80%" />

There are many further ways we can customize the plot. For example, we could change what the markers appear as. ``pch`` stands for plot character. To make the circles solid instead of hollow, we can specify ``pch=16``. 


```r
plot(pm_byday$T, pm_byday$meanpm10,
    xlab="Days Relative to Automation",
    ylab="Mean PM10", 
    main="Automation and Mean PM10",
    pch=16)
```

<img src="08-week8_files/figure-html/unnamed-chunk-20-1.png" width="80%" />

What would be particularly helpful is to have the reader understand when automation is occurring. Therefore, let's add a dashed line at 0 (the time automation occurs) and add additional text in order to label this line. We can again add lines through the ``lines()`` function. To add text we need to specify (1) where to place the text and (2) what text should appear. For example, to place text at ``(x=0,y=260)``, we would type ``text(0,260, "Text Here")``. Let's try this in our scatter plot and additionally show how to change the color of the text.


```r
plot(pm_byday$T, pm_byday$meanpm10, 
     xlab="Days After Automation",
     ylab="Mean PM10", main="Automation and Mean PM10",
     pch=16, ylim=c(0,300))
lines(c(0,0), c(-10,250), col="red", lty=2)
text(0,260, "Automation", col="red")
```

<img src="08-week8_files/figure-html/unnamed-chunk-21-1.png" width="80%" />

Finally, let's discuss how to actually save our plots. Saving plots consists of three steps:
  1. Use ``pdf()`` of ``png()`` to create the file where the plot will be created
  2. Run the code to create the plot 
  3. Type ``dev.off()`` to tell R you are done creating plots.
  
For example, let's say we want to save a PDF of our plot and we want it named ``Automation.pdf``. Our first step is to execute the code:


```r
pdf("Automation.pdf")
```

This will create a file named ``Automation.pdf`` in your current working directory. This will eventually hold our plot. Next, we need to re-run the code to create our plot:


```r
plot(pm_byday$T, pm_byday$meanpm10, 
     xlab="Days After Automation",
     ylab="Mean PM10", main="Automation and Mean PM10",
     pch=16, ylim=c(0,300))
lines(c(0,0), c(-10,250), col="red", lty=2)
text(0,260, "Automation", col="red")
```

Now that the plot has been generated, we need to execute:


```r
dev.off()
```

If you forget to execute ``dev.off()`` then the next plot you execute will also be written to ``Automation.pdf``. 

## Dates 

Dates can often be difficult to work when performing data analysis. In this section we are going to study a package called ``lubridate`` that can be very helpful when working with dates in R. 

As ``lubridate()`` is a new package, you first need to install lubridate via ``install.packages("lubridate")`` and then load into memory using the ``library()`` function:


```r
library(lubridate)

Attaching package: 'lubridate'
The following objects are masked from 'package:base':

    date, intersect, setdiff, union
```

``lubridate()`` comes with a variety of functions. For example, there are functions to tell you what day it is today:


```r
today()
[1] "2022-11-02"
```

Or even the exact time right now:


```r
now()
[1] "2022-11-02 09:28:25 PDT"
```

But most importantly, ``lubridate`` allows R to interpret strings of text as dates. For us, that means when we make a graph R will understand that an observation for January 1, 2012 was taken before an observation that was taken on March 3rd, 2014, for example. 

Additionally, ``lubridate()`` can interpret dates that come in a variety of formats. For example, we can use the ``ymd()`` function to convert a string of text that holds the date as ``"year-month-day"`` into a date object. 


```r
ymd("2012-01-22")
[1] "2012-01-22"
```

There is also a month-day-year function:


```r
mdy("January 22nd, 2012")
[1] "2012-01-22"
```

Or a day-month-year function:


```r
dmy("22-Jan-2012")
[1] "2012-01-22"
```

What is also important is that we can add days and times with ``lubridate`` functions. For example, 12 days after January 22nd 2012 is:


```r
ymd("2012-01-22") + days(12)
[1] "2012-02-03"
```

In 15 months it will be:


```r
ymd("2012-01-22") + months(15)
[1] "2013-04-22"
```

In 5 years it will be:


```r
ymd("2012-01-22") + years(5)
[1] "2017-01-22"
```

Often the date is actually more narrow than we need for our analysis. For example, maybe we only need the year portion of the date variable. We can extract this portion using the ``year()`` function:


```r
year(ymd("2012-01-22"))
[1] 2012
```

There are similar functions for extracting the month(``month()``), day in the month (``mday()``), or day of the week ``wday()``.

Now that we have a sense of ``lubridate()`` let's load return to the pollution monitoring data frame ``pm``. In this data frame, let's look at the variable ``date``.


```r
head(pm$date)
[1] 18628 18629 18630 18631 18632 18633
```

So this doesn't look very intuitive. What does 18628. Well, this is actually an artifact of how Stata stores dates (recall we originally read the data frame into R via a Stata dataset). It stores dates as the number of days since January 1, 1960. 

In other words, ``18628`` represents that this observation was taken ``18628`` days after January 1, 1960. We can figure out what day this is exactly by using functions from lubridate:


```r
ymd("1960-01-01")+days(18628)
[1] "2011-01-01"
```

So 18628 days from January 1, 1960 is January 1, 2011. 

Next, we are going to study rainfall over time. Rain may actually reduce the amount of pollution in the air. When rain falls, it attracts particles in the air before hitting the ground., in turn reducing the amount of pollution in the air. Therefore, we may expect to see natural changes in pollution throughout the year due to changes in the amount of rain. To understand seasonality of rainfall in China, we are going to make plots that show how rainfall varies over time. 

First, let's get a sense of how rainfall varies by the month. Let's create a data frame that has for each month of the year, the average level of rain. The variable ``rain`` in our data frame is the Daily Rain in mm. To create this data frame we are again going to utilize ``group_by()`` and ``summarize()``.


```r
pm_bymonth <- pm %>%
  mutate(rdate = ymd("1960-01-01") + days(date),
    month = month(rdate)) %>%
    group_by(month) %>%
    summarize(meanrain = mean(rain, na.rm=TRUE))
```

The first part of the code ``rdate = ymd("1960-01-01") + days(date)`` creates a new variable that is named ``rdate`` which captures the date of the observation. The next ``month=month(rdate)`` extracts the month the observation was taken. The rest of the code then summarizes the amount of rainfall by month. In the end, we have a data frame with 12 observations, with each month associated with an average value of rain fall. Let's now plot those values over time. 


```r
plot(pm_bymonth$month, pm_bymonth$meanrain, 
     col="blue",
     pch=16, 
     xlab="Date", 
     ylab="Mean Daily Rain (mm)")
```

<img src="08-week8_files/figure-html/unnamed-chunk-38-1.png" width="75%" />

China experiences much more rainfall May through September (i.e. months 5 through 9). Therefore, we might expect less pollution in these months. We can also see how this varies day-to-day. Instead of aggregating by month, let's generate a data frame that shows the amount of Daily Rain across China by day. 


```r
pm_byrdate <- pm %>%
  mutate(rdate = ymd("1960-01-01") + days(date)) %>%
  group_by(rdate) %>%
  summarize(meanrain = mean(rain, na.rm=TRUE))
```

Now let's plot rainfall over time:


```r
plot(pm_byrdate$rdate, pm_byrdate$meanrain, 
     col="blue",
     pch=16, 
     xlab="Date", 
     ylab="Mean Daily Rain (mm)")
```

<img src="08-week8_files/figure-html/unnamed-chunk-40-1.png" width="75%" />

Why are we looking at rain again? Well, what if automatic monitoring happened to be implemented at the end of the rainy season? In this case, we might expect to see increased pollution levels after automatic monitoring due to the changing seasons. In other words, rain fall is a potential confounding factor. We need to check that the change in pollution levels around automatic pollution monitoring isn't being driven by the changing seasons. We will return to this question in a later section.

## ggplot2

ggplot2 is a very popular graphics package in R. It has two major strengths. First, you can use ggplot2 to create a variety of figures. Second, the syntax to create different types of figures is very similar. Therefore, once you learn how to generate a few figures, you will be able to quickly learn how to create many different types of figures. The "gg" in ggplot2 stands for the grammar of graphics, and that is the goal of ggplot2: to have a consistent language through which to build figures. 

The philosophy to ggplot2 is that you want to build your graph in layers. The first layer is always the data, you always need to specify what data is going to be plotted. Then you will specify the aesthetics, which for our purposes you can think of as the variables that will be on your plot. Which variable will be on the horizontal axis? Which variables will be on the vertical axis. Then, we specify the type of plot. Is this a bar graph? Is it a line plot. In ggplot2, the type of graph is determined by the geometric function that you use. The basic syntax of a ggplot2 command that has all these components is shown below:


```r
ggplot(data = <DATA>) + 
  <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))
 }
```

We will replace the section ``<DATA>`` with whatever data we are using. In this next example, let's recreate the scatterplot that shows the average daily pollution levels relative to the automation date. If you recall, we already constructed a dataframe named ``pm_byday`` which contains for every day relative to automation (within a year), the average levels of pollution, as measured by PM10. However, for an example later in the section, we will also utilize a variable that captures mean rain by day. Therefore, let's construct a day-level dataset that contains for each day relative to automation, the average levels of PM10 and rain:


```r
pm_byday <- pm %>%
  mutate(T=date-auto_date) %>%
  filter(T>-364, T<364) %>%
  group_by(T) %>%
  summarize(meanpm10 = mean(pm10, na.rm=TRUE),
    meanrain=mean(rain, na.rm=TRUE)) %>%
  mutate(after=T>0)
```

For this example, we will replace ``<DATA>`` with ``pm_byday``. 

``<GEOM_FUNCTION>`` will be determine what type of plot appears. For example, ``geom_point`` is the geometric function to create a scatterplot. In this section, we will also discuss ``geom_boxplot`` and ``geom_histogram``. 

``mapping = aes(<MAPPINGS>)`` tells R what variables will appear in the graph. In our case, we want the x-axis to show the variable ``T``. If you recall, ``T`` represents the day relative to automation. A negative number indicates automation has not yet occurred, while a positive indicates it has already occurred. On the y-axis we want to display the mean PM10 level, which is stored in the variable ``meanpm10``. Therefore, the way we will specify the aesthetics will be ``mapping=aes(x=T,y=meanpm10)``.


```r
ggplot(data = pm_byday) + 
  geom_point(mapping = aes(x = T, y = meanpm10))
```

<img src="08-week8_files/figure-html/unnamed-chunk-43-1.png" width="672" />

Again, there are many ways to customize our plot. In the next code, let's specify ``color=blue`` for the markers, as well as add axes labels and an overall title.


```r
ggplot(data = pm_byday) + 
  geom_point(mapping = aes(x = T, y = meanpm10), color="blue") +
  xlab("Time After Automation") + 
  ylab("Mean PM10") + 
  ggtitle("Time After Automation and PM10")
```

<img src="08-week8_files/figure-html/unnamed-chunk-44-1.png" width="672" />

Finally, we can even color the dots by a different variables. For example, for each day relative to automation, we can color the marker by how much rain there was. This way, we can see if the automation date occurred around a change in the rain season. If so, then variation in pollution may be driven by variation in rain. 


```r
ggplot(data = pm_byday) +
  geom_point(mapping = aes(x = T, y = meanpm10,color=meanrain)) +
  xlab("Time After Automation") + ylab("Mean PM10") +
  ggtitle("Time After Automation and PM10")
```

<img src="08-week8_files/figure-html/unnamed-chunk-45-1.png" width="672" />

