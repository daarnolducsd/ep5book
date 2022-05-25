# Disrupting Education Using Technology

## Disrupting Education Intro



<html>
<head>
<style>
code {
  background-color: #f1f1f1;
}
</style>
</head>
<body>


Many developing countries have rapidly expanded access to education. However, not all places see measurable gains in learning. For example, in India, over 50 percent of students in grade 5 cannot read at a grade 2 level, despite enrollment rates around 95 percent (Pratham 2017)[@pratham2017].

One hypothesis behind this puzzling fact is termed the mismatch hypothesis. If curriculum is beyond a student's level of understanding, they may learn very little, even if attendance is high. In other words, there is a mismatch between the level of understanding and the curriculum being taught. In Muralidharan, Singh and Ganimiam (2019)[@msg2019disrupting], the authors study whether a technology that aims to "Teach at the Right Level" be used to improve learning outcomes. This is an important question: we need to find interventions that work! It is not necessarily true that more investment in education results better outcomes if we are investing in the wrong things.

The technology the authors study is called Mindspark. Mindspark is a computer software that provides learning materials that are appropriate for a student's understanding level. It does this by using information on what questions a student gets right vs. wrong. The level of material only increases in difficulty once the student has learned the previous concepts. Mindspark centers provide 6-day-a-week instruction for 90 minutes (45 minutes with Mindspark, 45 minutes from teaching assistants). THe question in Muralidharan, Singh and Ganimiam (2019) is: does this program improve learning outcomes?

To answer this question, the authors recruited participants from low-income neighborhoods in Delhi. At demonstration sessions for Mindspark, parents were introduced to the program. All participants interested in participating needed to fill out a baseline assessment. Then, parents were told that about $\frac{1}{2}$ of participants would receive a voucher that waived tuition for the Mindspark program (participants were chosen by lottery). Students not chosen by lottery were told they would obtain free access to the centers after February 2016 (after the experiment had concluded). The result is 619 participants, 305 in the control (i.e. no access to Mindspark) and 314 in the treatment (access to Mindspark)

To begin, let's load the dataset ``mindspark_data.dta``


```stata
cd "/Users/davidarnold/Dropbox/Teaching/EP5/online/04_week/data"
use mindspark_data.dta, replace

```

As usual, let's begin with describing the dataset 

<div class="figure" style="text-align: center">
<img src="images/04_describe.png" alt="Describing the Mindspark Data" width="90%" />
<p class="caption">(\#fig:msdescribe)Describing the Mindspark Data</p>
</div>

This is a subset of all variables in Muralidharan, Singh, and Ganimian (2019). We are interested in how being treated impacts learning outcomes. We have information about Math and Hindi tests at both the baseline and endline. Baseline: before any student has been offered free Mindspark. Endline: the treated students have been offered free Mindspark. To start, let's summarize these variables to get a sense of average test scores as well as the variation in test scores at baseline.


```stata
sum per_math1
sum per_hindi1
```


```
    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
   per_math1 |        619    .3177475    .1115478          0   .7428572

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
  per_hindi1 |        619    .4278406      .16484          0         .9
```

At the baseline, the average score on the math test was $0.318$. This indicates that on average across students, the average score was a 31.8 percent on the math test. For the Hindi test, the average was a bit higher at $0.428$. Now let's look at endline scores.


```stata
sum per_math2
sum per_hindi2
```


```
    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
   per_math1 |        619    .3177475    .1115478          0   .7428572

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
  per_hindi1 |        619    .4278406      .16484          0         .9
```

At endline, scores are higher. The average math score has increased to $0.503$ and the average Hindi score has increased to $0.552$. Our ultimate goal, however, is to understand how test scores change depending on whether you are given access to Mindspark. In other words, do test scores at endline depend on whether ``treat==1`` or ``treat==0``. Before we start analyzing the data, however, we are going to learn a new statistical technique: **regression**.

