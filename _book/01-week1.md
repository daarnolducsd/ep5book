# Financial Incentives and Student Performance (Excel)

## Introduction to Experiments

Did you know that countries with higher consumption of chocolate per capita tend to win more Nobel prizes? 

<div class="figure" style="text-align: center">
<img src="images/01_chocolate.png" alt="Chocolate Consumption and Nobel Prizes" width="75%" />
<p class="caption">(\#fig:chocolate)Chocolate Consumption and Nobel Prizes</p>
</div>

In Figure \@ref(fig:chocolate), the number of Nobel laureates per 10 million of the population (vertical axis) is plotted against the chocolate consumption in kilograms per capita in a given year (horizontal axis). As is clear in this graph, countries with higher rates of chocolate consumption also tend to have higher rates of Nobel laureates is an example of a **correlation**. A correlation is any statistical is any relationship between two variables. 

Correlations can be very interesting. In many cases they can lead to new research questions. But they don't often answer the questions social scientists are actually interested in. We are generally interested in understanding **causal relationships** between variables. 

To understand causal relationships, let's again consider the relationship between chocolate consumption and Nobel prizes. Do you think that if the U.S. wanted to increase the number of Nobel laureates, they should invest in chocolate and include chocolate in lunch meals for students? Probably not! It's unlikely that increased chocolate consumption **causes** an individual to win a Nobel prize. In this case, it is more likely that this correlation in the data just arose due to chance. Therefore, we have uncovered a **spurious correlation**, or a correlation that arose due to chance. There are many interesting spurious correlations. If you are interested in looking through some fun spurious correlations, just follow this [link](https://www.tylervigen.com/spurious-correlations). For example, you probably would not guess that consumption of mozzarella cheese is correlated with civil engineering doctorates awarded, but see Figure \@ref(fig:spurious) for this surprising correlation.
 
<div class="figure" style="text-align: center">
<img src="images/01_spurious.png" alt="Example of a Spurious Correlation from tylervigen.com" width="100%" />
<p class="caption">(\#fig:spurious)Example of a Spurious Correlation from tylervigen.com</p>
</div>
If we need to decide whether a given policy is worth it or not, we need to understand how it causally impacts individual's outcomes. To see why, let's imagine a high school is trying to decide whether to invest in a new after-school program designed to help students with SAT prep. Currently, they do not have such a program on campus, but they know some of their students attend programs offered outside the school. In order to try and understand the benefits of the program, the school decides to use data on past students to see if those who attended SAT prep programs outperformed students that did not.

The school finds those who attended SAT test prep programs score much higher on the SAT than those who did not. Does this mean the SAT test prep program works and the school should invest in one? Maybe, maybe not. There are two stories that could potentially rationalize this finding. Story 1 is that the programs are effective ways for students to learn the material they need to perform well on the SAT. That is, the program has a causal impact on SAT scores. Story 2 is that the programs are not actually effective. However, students that self-select into SAT programs also tend to be more motivated overall. They could, in theory, vary along many dimensions: academic ability, interest in college, parental background. It could be that any of these differences are actually driving the differences in SAT scores. 

With only **observational data** it is difficult to tell which story is true. However, there is along-established way to identify causal relationship in medicine: the randomized control trial (RCT). To understand RCTs, imagine we are testing whether a given drug reduces blood pressure. To study the effectiveness we recruit a group of participants. Half of the participants are randomly placed into the **treatment** group and given the drug. The other half are placed into the **control** or **placebo** group and given a placebo drug. Now we can just compare outcomes for the two groups over time to understand the impact of the drug. 

The key to a well-done experiment is **randomization**. If who receives the treatment is completely random, then on average, the two groups will be very similar. For example, in our test prep example, if we could randomly split students into two groups: test prep vs. no test prep, then we could evaluate the impacts of the program. Since students are no longer self-selecting into the program, there should be little difference in the two groups in terms of academic ability, college interest, parental background.

Not all questions in social science can be answered with an experiment. In certain cases it may be prohibitively expensive or unethical to run an experiment. However, if an experiment can be done, it is hard to find more convincing evidence. Experiments have been widely influential in many social sciences. For example, in the field of development economics, a large number of experiments have been undertaken in order to develop policies aimed at alleviating global povery. In 2019, Abhijit Banerjee, Esther Duflo, and Michael Kremer won the Nobel Prize in Economics "for their experimental approach to alleviating global poverty."

In this course, we will be studying a number of social science experiments. Our first experiment comes from Brownback and Sadoff (2020). The motivation for this experiment is a startling statistic. Only 40 percent of community college students earn a college degree within 6 years (Shapiro et al. 2017). Given these poor outcomes, it is important to consider tools to improve performance. In Brownback and Sadoff (2020) the researchers explore one potential tool that has been previously unexplored: financial incentives to instructors. This is often referred to as a pay-for-performance model. Instructors are paid for how well their students perform. While prior experiments have studied this model in some settings, no prior work has explored how this would function in the community college setting. 

Brownback and Sadoff (2020) run the following experiment at a community college in Indiana (Ivy Tech):

  - Some instructors (the treatment group) received \$50 for each student that passes an externally-administered test 
  - Other instructors (the control group) did not receive such an incentive. 
  
The key in their design is that the instructors that are chosen to receive the incentives are randomly selected. Therefore, they are not, on average, better teachers than instructors in the control group. Therefore, if we observe any difference in student performance between the treatment and control, then it must be due to the financial incentives for instructors. 

## Data from Brownback and Sadoff (2020)

In many disciplines, there has been a push toward transparency and replication. Past work has shown that some very influential studies have failed to replicate (See [replication crisis](https://en.wikipedia.org/wiki/Replication_crisis#In_economics)). A common way to provide transparency is to have authors make the data from their research publicly available. That means we will get to use the actual data from the experiments we are studying in this class. 

Table \@ref(fig:bsdata) shows a selection of the data from Brownstone and Sadoff (2020). The actual data is much larger, but only a subset of the variables will be relevant for our analysis. This is referred to as a **data table**. Each **row** in a data table is an \underline{observation}, while each **column** is a variable. 

<div class="figure" style="text-align: center">
<img src="images/01_data.png" alt="Data From Brownstone and Sadoff (2020)" width="75%" />
<p class="caption">(\#fig:bsdata)Data From Brownstone and Sadoff (2020)</p>
</div>

It is always important to understand the structure of your data before proceeding with any data analysis. One of the most important components of understanding the structure is to discern the **unit of observation**. The unit of observation is the level at which the data is reported. To discern it for yourself, just think about what each row of the dataset represent. Is each row an individual, a neighborhood, a country, a state? To practice, let's go through a few examples.

 
What is the unit of observation in Table \@ref(fig:student)?

<div class="figure" style="text-align: center">
<img src="images/01_student.png" alt="Unit of Observation Example 1" width="50%" />
<p class="caption">(\#fig:student)Unit of Observation Example 1</p>
</div>

To answer this question, we need to decide what a row represents. In this case, each row corresponds to a different student. Therefore the observation level is a student.

 
What is the unit of observation in Table \@ref(fig:studentterm)?

<div class="figure" style="text-align: center">
<img src="images/01_student_term.png" alt="Unit of Observation Example 2" width="55%" />
<p class="caption">(\#fig:studentterm)Unit of Observation Example 2</p>
</div>

Again, we need to decide what a row represents. In this case, each row corresponds to a different student in a different term. Therefore the observation level is a student-term.

Now let's think about what the unit of observation is in the Brownstone and Sadoff (2020) data. The variable **AnonID** is the identifier for a student. The variable **CourseNumber** is the identifier for a course. This dataset seems to be giving us the information for a student in a given course. Therefore the observation level is a student-course. 

Before we get to analyzing the data, let's actually learn about our first feature in Excel. When browsing an excel file, it is often convenient to **freeze** the first row so that it is always visible. In our case, the first row holds variable names. Therefore, if we freeze the first row we can scroll through the data without having to remember what each column corresponds to. 

To freeze the first row go to the **View** and then click **Freeze Top Row** (See \@ref(fig:freeze)).

<div class="figure" style="text-align: center">
<img src="images/01_freeze.png" alt="Freezing the First Row" width="100%" />
<p class="caption">(\#fig:freeze)Freezing the First Row</p>
</div>

Let's talk a little bit about our goal with this dataset. Our goal is to determine if providing financial incentives to teachers impacts student performance. The variable **Treatment Arm** details whether a student has an instructor that received incentives or is in the control group. Therefore, we can see if test scores improve based on the Treatment Arm of the student. To perform this analysis, we need to learn how to use **functions** in Excel. 

## Statistical Functions

A function is something that takes in an input and produces an output. For example, you can think of taking the average as a function. The input is a list of numbers, and the output is the average of that list of numbers.  When the inputs and outputs of a function are numbers (as it is in this example), then it is a **statistical function**. 

In Excel, statistical functions are extremely important to understand. If you are doing research, it is common to start out with a list of summary statistics. If you are in business, it might be important to know some summary statistics about your products, sales, costs, etc. To create summary statistics these summary statistics, we use statistical functions. 

In order to illustrate the use of statistical functions, let's consider the following dataset that has information on Gross Domestic Product (GDP) for ten countries

<div class="figure" style="text-align: center">
<img src="images/01_gdp2020.png" alt="GDP in 2020" width="100%" />
<p class="caption">(\#fig:gdp2020)GDP in 2020</p>
</div>


Let's introduce our first statistical function: the ``AVERAGE`` function. This function will take in a list of numbers and output the average of all those numbers. There are many statistical functions in Excel, including:
 
  - ``COUNT`` -- counts the number of numbers  
  
  - ``SUM`` -- adds up the numbers
  
  - ``AVERAGE`` -- averages the numbers 
  
  - ``MEDIAN`` -- retrieves the median of all numbers
  
  - ``MAX``, ``MIN`` -- retrieves the maximum and minimum of all numbers
  respectively 
  
  - ``MODE`` -- retrieves the mode of all numbers


In order to make use of statistical functions, we first need to learn how to reference cells. In Excel, every cell is identified by a column letter and a row number. For example, in \@ref(fig:japan) I have clicked on the cell that holds the word "Japan". This entry is in column A of row 4. Therefore, this is cell A4. 

<div class="figure" style="text-align: center">
<img src="images/01_japan.png" alt="How to Reference a Cell" width="100%" />
<p class="caption">(\#fig:japan)How to Reference a Cell</p>
</div>

You can also reference a range of cells (this will be useful when taking averages). For example, to reference rows 2-6 of column C we could type ``C2:C6`` (See \@ref(fig:cells)). Whenever you read a colon in Excel, you should read it as "through". Therefore, the text ``C2:C6`` can be read as "cells C2 through C6".  
  
<div class="figure" style="text-align: center">
<img src="images/01_cells.png" alt="Referencing a Range of Cells" width="70%" />
<p class="caption">(\#fig:cells)Referencing a Range of Cells</p>
</div>

Sometimes, it is helpful to reference an entire column. For example, later we will open an Excel spreadsheet that has thousands of students. In some cases, it will be helpful to reference an entire column when using statistical functions. For example, if we are interested in the average of a variable in column C, we can type ``C:C`` to reference the entire column. 

Now that we understand how to reference cells, we can begin to apply functions. We will begin with the ``AVERAGE`` functions which can compute an average of a list of numbers. In our spreadsheet, we are interested in computing the average GDP across these ten countries. To do so, we can first click in an unpopulated cell and type:

\begin{center}
\colorbox{gray!20}{\texttt{=AVERAGE(C:C)}}
\end{center}

Note the ``=`` sign in the text above. This tells Excel to evaluate the function. If you omit the ``=`` you will find that the cell is just populated with the text ``AVERAGE(C:C)`` and not the average value of column C. 

Figure \@ref(fig:average1) depicts an example where we have set up a Summary Statistics table for this dataset. In cell F3, we have written the function that calculates the average GDP across these ten countries. 

  
<div class="figure" style="text-align: center">
<img src="images/01_average1.png" alt="Computing Average GDP in 2020 (Before Pressing Enter)" width="80%" />
<p class="caption">(\#fig:average1)Computing Average GDP in 2020 (Before Pressing Enter)</p>
</div>

As soon as we present enter, the function will be evaluated and the average will appear in cell F3 (see Figure \@ref(fig:average2)).

<div class="figure" style="text-align: center">
<img src="images/01_average2.png" alt="Computing Average GDP in 2020 (After Pressing Enter)" width="80%" />
<p class="caption">(\#fig:average2)Computing Average GDP in 2020 (After Pressing Enter)</p>
</div>

The rest of the summary statistics are completely analogous, replacing ``AVERAGE`` with the relevant function. See Figure \@ref(fig:gdpsumstats) for the output of the rest of the Summary Statistics table.

<div class="figure" style="text-align: center">
<img src="images/01_gdp_sum_stats.png" alt="Summary Statistics Table" width="80%" />
<p class="caption">(\#fig:gdpsumstats)Summary Statistics Table</p>
</div>

## Logical Functions

Another type of function in Excel is called a **logical function**. Before learning about **logical functions** we need to learn more about logical statements in general. A logical statement is a statement that is either true or false. For example, all of the following statements are either true or false. 

  - "The student passed the class" 
  
  - "The participant is in the treatment group" 
  
  - "The temperature is below freezing"
  
These statements are all either true or false. This type of binary logic is incredibly important in certain areas of mathematics as well as the development of computers. An entire branch of mathematics, termed **Boolean algebra**, deals with variables that take on binary values.

In Excel, we can type logical statements and Excel will evaluate whether the statement is True or False. The key is you need to type the statement in the correct format so that Excel understands what you are trying to ask. 

For example, in our dataset on GDP in 2020, one example of a logical statement is: "GDP is greater than 10 trillion dollars." But how do we type the statement "GDP is greater than 10 trillion dollars." 

Figure \@ref(fig:tf1) depicts how we would type this statement for the first observation in the dataset (the U.S.). To evaluate whether GDP is greater than 10 trillion for the U.S. we type ``=(C2>10)``. The equals sign tells Excel to evaluate the logical statement that follows. The logical statement that follows ``C2>10`` is simply asking whether the value in cell C2 (i.e. U.S.'s GDP) is greater than 10. 

<div class="figure" style="text-align: center">
<img src="images/01_tf1.png" alt="Is GDP Greater than 10 in the U.S. Part 1" width="100%" />
<p class="caption">(\#fig:tf1)Is GDP Greater than 10 in the U.S. Part 1</p>
</div>

Once we press enter, we will get the result. In this case, we can see GDP in the U.S. is indeed greater than 10 trillion dollars. Therefore, when the function in cell D2 is evaluated it returns the answer ``TRUE`` as can be seen in Figure \@ref(fig:tf2).

<div class="figure" style="text-align: center">
<img src="images/01_tf2.png" alt="Is GDP Greater than 10 in the U.S. Part 2" width="100%" />
<p class="caption">(\#fig:tf2)Is GDP Greater than 10 in the U.S. Part 2</p>
</div>

Once we have filled in the formula for one cell, we can also apply it to the remaining observations. In our example, this would mean testing whether each country's GDP is more than 10, not just the U.S. There are a couple of ways to do this efficiently in Excel.

One way to fill in the formula is to click the bottom right corner of cell D2 and then drag down. This allows you to apply to as many observations as you would like. However, we often want to apply the logical statement to all observations. Therefore, continuously dragging will be inefficient if there are thousands of observations in the data. To quickly apply a formula to all cells in a column, we can simply double click the bottom right corner of a cell. In our example, this would mean double clicking the bottom right corner of the D2 cell.  

<div class="figure" style="text-align: center">
<img src="images/01_fill.png" alt="Filling in the Formula" width="100%" />
<p class="caption">(\#fig:fill)Filling in the Formula</p>
</div>

Oftentimes, instead of returning "TRUE" or "FALSE", it is convenient to have Excel return the value in another form. For example, a common way to represent "TRUE" is with the number 1 and "FALSE" with the number 0. To accomplish this in Excel we will use the ``IF`` function. 

The basic format for the ``IF`` function is: 

\begin{center}
\colorbox{gray!20}{\texttt{=IF(logical test,value if TRUE, value if FALSE)}}
\end{center}

For example, in our dataset, if we want to return the value of 1 if GDP is greater than 10 and 0 if otherwise, we can type:

\begin{center}
\colorbox{gray!20}{\texttt{=IF(C2>10,1,0)}}
\end{center}

<div class="figure" style="text-align: center">
<img src="images/01_if1.png" alt="Using the IF function (Before Pressing Enter)" width="100%" />
<p class="caption">(\#fig:ifex1)Using the IF function (Before Pressing Enter)</p>
</div>

Once we press enter, the function is evaluated. To fill in the formula for the rest of the observations you can follow the same steps as above.

<div class="figure" style="text-align: center">
<img src="images/01_if2.png" alt="Using the IF function (After Pressing Enter)" width="100%" />
<p class="caption">(\#fig:ifex2)Using the IF function (After Pressing Enter)</p>
</div>

## Summary Statistics 

Now let's return to our data from Brownback and Sadoff (2020). Our goal is to create a table of basic summary statistics. However, a key variable in the Brownback and Sadoff (2020) experiment is whether a given student passed the test or not. This financial compensation of an instructor (in the treatment group) directly depends on how many students pass the test. This currently does not appear in our dataset, so we will have to create it. 

To create this variable we need to take three steps:

- **First Step:** Title the column with the variable name "Passed" 

- **Second Step:** Use the ``IF`` function to fill in this variable for the first observation 

- **Third Step:** Double click bottom right of cell in step 2 to fill in the variable for all observations

Figure \@ref(fig:passed1) presents steps 1 and 2 in Excel.

<div class="figure" style="text-align: center">
<img src="images/01_passed1.png" alt="Generating a Passed Variable (Steps 1 and 2)" width="100%" />
<p class="caption">(\#fig:passed1)Generating a Passed Variable (Steps 1 and 2)</p>
</div>

We simply can double click the bottom right of G2 to fill in the rest of the observations (as seen in Figure \@ref(fig:passed2)).

<div class="figure" style="text-align: center">
<img src="images/01_passed2.png" alt="Generating a Passed Variable (Step 3)" width="100%" />
<p class="caption">(\#fig:passed2)Generating a Passed Variable (Step 3)</p>
</div>

Now that we've generated the variables we need let's fill in some summary statistics displayed on the right side of the datasheet in Figure \@ref(fig:sumstats1)

<div class="figure" style="text-align: center">
<img src="images/01_sumstats1.png" alt="Blank Summary Statistics Table" width="100%" />
<p class="caption">(\#fig:sumstats1)Blank Summary Statistics Table</p>
</div>

To compute average age in the dataset we just need to use the ``AVERAGE`` function and reference column C. 

<div class="figure" style="text-align: center">
<img src="images/01_sumstats2.png" alt="Average Age" width="100%" />
<p class="caption">(\#fig:sumstats2)Average Age</p>
</div>

Average test score is completely analogous to age, but we now reference column F.

<div class="figure" style="text-align: center">
<img src="images/01_sumstats3.png" alt="Average Test Score" width="100%" />
<p class="caption">(\#fig:sumstats3)Average Test Score</p>
</div>

In order to compute fraction that passed the test, we are going to make a small digression, one that will clarify one reason it was convenient to store the variable Passed with a 1 if the individual passed and a zero otherwise. Because we have stored the variable in this way, we can simply take the average value of Passed and this will be equal to the fraction that passed the test. 

To see why this is true, let's first write out the equation for the average of a generic variable $X$  

$$
  \bar{X} = \frac{X_1 + ... + X_N}{N} 
$$

Where $N$ is the number of observations, $X_1$ is the first observation and $X_N$ is the $N^{th}$ observation. If $X$ is a binary variable that is equal to 1 or zero, then the average will be the fraction of individual's with a 1
$$
  \bar{X} = \frac{X_1 + ... + X_N}{N}=\frac{\text{Number of observations =1 }}{\text{Total Observations}} 
$$
Since our variable "Passed" is equal to 1 if passed and zero otherwise, the fraction who passed is the average of our "Passed" variable. Therefore, in Excel we simply need to compute the average of the G column

<div class="figure" style="text-align: center">
<img src="images/01_frac_passed.png" alt="Computing the Fraction Passed" width="100%" />
<p class="caption">(\#fig:fracpassed)Computing the Fraction Passed</p>
</div>

Finally, to finish our summary statistics table, we need to fill in the total number of observations. To do this, we can use the ``COUNT`` function, which will count the total number of numbers in a column. While Figure \@ref(fig:count) uses Column G to compute total observations, this could be replaced with any column that has non-missing numeric data. 

<div class="figure" style="text-align: center">
<img src="images/01_count.png" alt="Computing Total Observations" width="100%" />
<p class="caption">(\#fig:count)Computing Total Observations</p>
</div>

## Pivot Tables {#S:pivottables}

So far, we have learned to retrieve summary statistics using functions. This works very well for retrieving summary statistics for the entire dataset. Sometimes however we want more complicated summary statistics. For example, in our empirical application, we might be interested in passing rates for different departments. While it is possible to retrieve these using functions, an easier way is through a **pivot table**. The name "pivot" comes from "pivoting" the data into a way the provides useful information. 

To understand what we are trying to accomplish with our pivot table, let's start by looking at our end goal in Figure \@ref(fig:pivotfinal). In the Pivot Table, each **row** is a separate department, with the fraction passed displayed.  

<div class="figure" style="text-align: center">
<img src="images/01_pivot_final.png" alt="Pivot Table: Pass Rates by Department" width="38%" />
<p class="caption">(\#fig:pivotfinal)Pivot Table: Pass Rates by Department</p>
</div>


Now let's go through how to construct Figure \@ref(fig:pivotfinal). To insert a pivot table, go to the Insert tab and click "Insert Pivot Table", as seen in Figure \@ref(fig:pivot1)

<div class="figure" style="text-align: center">
<img src="images/01_pivot1.png" alt="Inserting a Pivot Table" width="100%" />
<p class="caption">(\#fig:pivot1)Inserting a Pivot Table</p>
</div>

Next, you need to select a table or range. You should select all of the variables that you want to be in your pivot table. In our case, we need to have both the department and whether an individual passed. To select a range, we can click on a column (for example D), hold down, and then drag to another column (for example G). Since we began at D and dragged to G, the variables ``DepartmentCode``, ``TreatmentArm``, ``TestScore``, and ``Passed`` will all be variables that we can include in the pivot table. 

<div class="figure" style="text-align: center">
<img src="images/01_pivot3.png" alt="Selecting a Range for the Pivot Table" width="100%" />
<p class="caption">(\#fig:pivot3)Selecting a Range for the Pivot Table</p>
</div>

You can also choose where you would like your pivot table to appear. By default, the table will be placed in whichever cell you clicked last (in my case this is cell ``I10``). Therefore, before you insert a pivot table, you should click the cell where you would like it to appear.

As can be seen in Figure \@ref(fig:pivot4), Excel has drawn a blank Pivot table. On the right we can see the new panel "PivotTable Fields" which we will use to build our Pivot table

<div class="figure" style="text-align: center">
<img src="images/01_pivot4.png" alt="A Blank Pivot Table" width="100%" />
<p class="caption">(\#fig:pivot4)A Blank Pivot Table</p>
</div>

We want each row in our pivot table to be a Department Code. So click the box next to ``DepartmentCode`` to put it into the pivot table.

<div class="figure" style="text-align: center">
<img src="images/01_pivot5.png" alt="Adding DepartmentCode to the Pivot Table" width="100%" />
<p class="caption">(\#fig:pivot5)Adding DepartmentCode to the Pivot Table</p>
</div>

By default (see Figure \@ref(fig:pivot5)), Excel has placed this variable into the Values panel, but we want it to be in the Rows panel. We can move variables between these windows by clicking and dragging. In this example we want to move ``DepartmentCode`` to the Rows panel.

<div class="figure" style="text-align: center">
<img src="images/01_pivot6.png" alt="Adding DepartmentCode to the Pivot Table" width="100%" />
<p class="caption">(\#fig:pivot6)Adding DepartmentCode to the Pivot Table</p>
</div>

In the Values panel, we want pass rates. We will compute these pass rates from the variable "Passed" 

<div class="figure" style="text-align: center">
<img src="images/01_pivot7.png" alt="Adding Passed to the Pivot Table" width="100%" />
<p class="caption">(\#fig:pivot7)Adding Passed to the Pivot Table</p>
</div>

By default Excel is displaying the "SUM" by department (i.e. number of individuals that passed, not the fraction that passed). To change the displayed statistic click the "i" next to the "Values" label and then select "Average".

<div class="figure" style="text-align: center">
<img src="images/01_pivot7.png" alt="Average Pass Rates" width="100%" />
<p class="caption">(\#fig:pivot8)Average Pass Rates</p>
</div>

Now we've reached our goal! A table that shows average pass rates by department (Figure \@ref(fig:pivotfinal)).

## Balance Tables

The key aspect of a randomized control trial that allows us to infer causality is randomization. If randomization is successful, then individuals selected for the treatment should be similar (on average) to those selected for the control. Therefore, a key component of any analysis of experimental data is to show that the treatment and control are similar based on observable characteristics.

To understand how a balance test might fail, let's imagine researchers are testing whether a given drug reduces cholesterol. The experimenters receive a list of 200 participants for the trial and decide the first 100 names on the list will receive the treatment and the second 100 will receive the placebo. What they fail to realize is that the list of applicants is sorted from youngest to oldest. Therefore, only the youngest participants receive the treatment. But younger applicants, on average, probably have lower cholesterol to begin with, so differences between treatment and control may be due to age, not due to the treatment. 

If we perform a balance test (i.e. calculate average age by treatment and control) we would immediately detect our error. Now, no "real" experiment would ever be run in such a way. To do so would be ignoring standard protocol for well-run experiments! Still, it is important to understand whether there are differences between treated and control units before proceeding with the main analysis.Finding persistent differences with respect to observables could be evidence that randomization somehow failed. In our empirical application, we have information on the age of the student, so let's see if age varies between the treatment and control.

We want to retrieve the average age by Treatment Arm. To do so we can use a pivot table! The **Rows** will be the Treatment Arm, while the **Values** will be age. We can follow the exact same steps as in Section \@ref(S:pivottables) to build the balance table displayed in Figure \@ref(fig:balance)

<div class="figure" style="text-align: center">
<img src="images/01_age.png" alt="Average Age by Treatment Group" width="100%" />
<p class="caption">(\#fig:balance)Average Age by Treatment Group</p>
</div>

As can be seen in Figure \ref(fig:balance), the average age in the treatment group (i.e. the Instructor Incentives group) and the control group is roughly the same, at 24.5 years of age. While we are keeping this illustrative example simple, generally papers will show a balance table for many observables. While there may occasionally be differences between certain characteristics, on average, the two groups will tend to be similar if randomization was implemented successfully. In particular, researchers use statistics to determine whether differences between treatment and control units are **statistically significant**. We will learn more about statistical significance later in this book.

## Impact of Financial Incentives {#S:impact}

Now that we have checked that randomization was successful, let's estimate our first result. As a reminder, we are studying whether offering financial incentives to instructors (a 50 dollar bonus for a student passing a test) improves performance of the students. Given only 40 percent of community college students earn a college degree within 6 years (Shapiro et al. 2017), it is important to consider tools to improve performance.

We want to compute the average pass rate for individuals in the treatment vs. individuals in the control. We can again use a pivot table to accomplish this! Our **Rows** will be ``TreatmentArm`` and the **Values** will be ``Passed``. Again, we can follow the steps in Section \@ref(S:pivottables) to construct this table. The pivot table is displayed in Figure \@ref(fig:firstresult).


<div class="figure" style="text-align: center">
<img src="images/01_result1.png" alt="Impact of Financial Incentives on Pass Rates" width="50%" />
<p class="caption">(\#fig:firstresult)Impact of Financial Incentives on Pass Rates</p>
</div>

Giving instructors' incentives increases pass rates by 7 percentage points! That is a big impact! Before exploring this result further, now is a good time to discuss how we accurately discuss this result. One common mistake (for both students and journalists) is to mix up the terms percentage point and percent. 

In our example, 40 percent of control students pass the test, while 47 percent of treated students pass the test. Therefore, treatment increased pass rates by 7 **percentage points**. This is not the same as saying the treatment increased pass rates by 7 percent. 

The percent increase in pass rates can be computed, but it is not equal to 7 percent. To calculate the percent increase in pass rates for the treatment relative to the control we can compute:


$$
\frac{\text{Pass Rate Treatment}-\text{Pass Rate Control}}{\text{Pass Rate Control}}= \frac{0.471-0.400}{0.400}=0.1775
$$

So the treatment pass rate is 17.75 percent higher relative to the control. This mistake can be misleading! For example, let's imagine the probability of dying during a given procedure is 2 percent. However, a doctor tries a new surgical technique and finds the probability of dying under the alternative procedure is 1 percent. 

This is a 1 percentage point decrease in the probability of dying during the procedure. However, it is a 50 percent decrease in the probability of dying during the procedure. Now, if a journalist wrote an article and incorrectly stated that the new procedure decreases death rates by 1 percent, then it sounds as if the new technique is not that much better than the old technique. However, that is the wrong conclusion. The correct conclusion is that a 1 percentage point decrease in the probability of dying implies a 50 percent reduction in the probability of dying, a huge advance!

So let's take stock of what we have learned. Providing financial incentives to community college instructors seems to increase pass rates on average. This is an important finding. Prior work on "pay-for-performance" in the United States has shown limited effectiveness in K-12 schools (See Neal (2011)). But this is the first study to show financial incentives can be an effective tool in the Community College setting. This is an important general lesson:  the context of the treatment matters! Just because a treatment is effective in one setting doesn't mean it will be effective in another (or vice-versa).

Next, let's talk about what else we can learn from this experiment. Well, this study was done across many different subjects. Maybe the effect of finacnial incentives differs depending on the department. It may be easier to get students over the pass threshold in some disciplines, making the incentives potentially more effective.

To explore this question we can adjust our pivot table a bit. We will proceed in two steps:
  
  - First: Move "TreatmentArm" to Column Panel
  
  - Second: Move "DepartmentCode" to Row
  
If you have successfully moved the variables around, your PivotTable Fields should look like \@ref(fig:pivotfield).
  
<div class="figure" style="text-align: center">
<img src="images/01_pivot_field.png" alt="Pivot Fields" width="35%" />
<p class="caption">(\#fig:pivotfield)Pivot Fields</p>
</div>

Figure \@ref(fig:hetresults) displays the results.

<div class="figure" style="text-align: center">
<img src="images/01_pivot_het_blank.png" alt="Pivot Fields" width="75%" />
<p class="caption">(\#fig:hetresults)Pivot Fields</p>
</div>

In some departments, the instructor incentives were incredibly effective. For example, in the communications department (``COMM``), the instructor incentives led to a dramatic increase in pass rates. In the control group, the pass rates were only 14 percent, while they were 60 percent in the treatment group. This is a 46 percentage point increase in pass rates, or equivalently, a 329 percent increase in pass rates in the treatment relative to the control

In other departments, however, the instructor incentives don't seem particularly effective. For example, in the math department (``MATH``), pass rates were similar in both the treatment group (41 percent) and the control group (42 percent). Therefore, it does not seem as if these incentives impact all departments in the same way. 

It is often useful to explore heterogeneity in this way. Through this analysis we learned financial incentives are not necessarily a "one-size fits all" solution.  Some departments are able to increase pass rates considerably, while other show modest or even zero/negative impact. If we want to apply these results to other settings we will need to think about how the other setting is similar or different to ours.

## Pivot Charts (Basic) {#S:pivotbasic}

In this section we will learn about something closely related to pivot tables: a pivot chart. Pivot charts and pivot tables contain the same information, but often charts/figures are more effective in presenting information. In popular press articles it's common to see a nicely designed figure to grab readers' attention. 

Let's walk through how to make a pivot chart in Excel.To insert a pivot chart, go to the Insert tab and click the Pivot Chart icon

<div class="figure" style="text-align: center">
<img src="images/01_pivot_chart1.png" alt="Inserting a Pivot Chart" width="100%" />
<p class="caption">(\#fig:pivotchart1)Inserting a Pivot Chart</p>
</div>

The pivot chart fields are similar to the pivot table fields. We can choose different combinations to create different figures

<div class="figure" style="text-align: center">
<img src="images/01_pivot_chart2.png" alt="Pivot Chart Fields" width="25%" />
<p class="caption">(\#fig:pivotchart2)Pivot Chart Fields</p>
</div>

Our goal now is to create a pivot chart that presents the first main result. In other words, a chart that shows average pass rates by ``TreatmentArm``. Therefore, in the pivot chart fields we will put ``TreatmentArm`` on the Axis and ``Average of Passed`` as the Values. 

<div class="figure" style="text-align: center">
<img src="images/01_pivot_chart3.png" alt="Pivot Chart Fields" width="100%" />
<p class="caption">(\#fig:pivotchart3)Pivot Chart Fields</p>
</div>

You can see a pivot table has also been created in Figure \@ref(fig:pivotchart3). The pivot table and chart are linked (i.e. changes made to the pivot table will be reflected in the chart). 

The "(blank)" on the horizontal axis serves no purpose. We can rid of it by altering the pivot table. To do so we can click the arrow on the bottom right of the cell that reads "Row Labels"


<div class="figure" style="text-align: center">
<img src="images/01_pivot_chart4.png" alt="Filtering Out Blank" width="50%" />
<p class="caption">(\#fig:pivotchart4)Filtering Out Blank</p>
</div>

Next, a window will pop up. We can deselect "(blank)" to remove it from the Pivot Table

<div class="figure" style="text-align: center">
<img src="images/01_pivot_chart5.png" alt="Filtering Out Blank" width="70%" />
<p class="caption">(\#fig:pivotchart5)Filtering Out Blank</p>
</div>

Blank has now been removed from both the Pivot Table and the Pivot Chart. While our current figure technically has all the relevant information to understand the impact of financial incentives on student performance, it leaves a lot to be desired. We need a reader to understand the information clearly, but right now we are missing proper titles and labels. This is something that will come up many times throughout the course. To convey our data analysis effectively, we need to ensure that figures and tables are properly titled and labeled. One "trick" is to pretend you have never seen the table or figure you have created. Would you be able to understand the information? If not, what is missing?

To edit the title, we can just click in the "Total" box at the top and edit. Make sure to always give descriptive titles with proper capitalization

<div class="figure" style="text-align: center">
<img src="images/01_pivot_chart8.png" alt="Adding a Title" width="70%" />
<p class="caption">(\#fig:pivotchart8)Adding a Title</p>
</div>

We also need to add horizontal and vertical axes titles. To insert these go to "Design", click "Insert Chart Element", and select one of the Axes Titles to add in a text box that we can edit

<div class="figure" style="text-align: center">
<img src="images/01_pivot_chart9.png" alt="Adding Axes Titles" width="90%" />
<p class="caption">(\#fig:pivotchart9)Adding Axes Titles</p>
</div>

Once we have added in proper axes titles, there is just one last thing to do. Our figure has a legend on the right, but it is neither descriptive nor necessary in this particular figure. Legends are important when you are trying to differentiate between the bars in a bar chart. For our figure, we can already discern this from the horizontal axes labels. Therefore, we can simply click on the legend and press backspace to delete it. Finally, we have our ultimate figure that shows average pass rates by ``TreatmentArm``

<div class="figure" style="text-align: center">
<img src="images/01_pivot_chart11.png" alt="Average Pass Rates by Treatment Arm" width="60%" />
<p class="caption">(\#fig:pivotchart11)Average Pass Rates by Treatment Arm</p>
</div>

## Pivot Charts (Advanced) {#S:pivotadvanced}

Next we are going to use pivot charts to display the heterogeneity in treatment effects across different departments. Our pivot chart currently displays the average of ``Passed`` by ``TreatmentArm``. We want to to present the average of ``Passed`` by ``TreatmentArm`` separately for every value of ``DepartmentCode``. 

Therefore, we need to place ``DepartmentCode`` somewhere in our Pivot Chart Fields. But where? Legend(Series) seems like a potentially good choice. Whatever variable you put into Legend(Series), Excel will create a plot similar to the current plot, but with separate bars for every value of the variable in Legend(Series). In our case, separate bar charts for every value of ``DepartmentCode``

Figure \@ref(fig:advpivot2) displays the results if we drag ``DepartmentCode`` to Legend(Series).

<div class="figure" style="text-align: center">
<img src="images/01_adv_pivot2.png" alt="Average Pass Rates by Treatment Arm and Department" width="60%" />
<p class="caption">(\#fig:advpivot2)Average Pass Rates by Treatment Arm and Department</p>
</div>

Here would be a good time to check whether this figure is interpretable for someone that did not create it. Right now, it is unclear what the different bars represent. There is no legend that shows which color bar is associated with which department.

To insert a Legend, go to "Design", press "Add Chart Element" and navigate to "Legend"

<div class="figure" style="text-align: center">
<img src="images/01_adv_pivot3.png" alt="Average Pass Rates by Treatment Arm and Department" width="100%" />
<p class="caption">(\#fig:advpivot3)Average Pass Rates by Treatment Arm and Department</p>
</div>
 
Figure \@ref(fig:advpivot3) displays the resulting figure. This is the resulting figure. 

<div class="figure" style="text-align: center">
<img src="images/01_adv_pivot4.png" alt="Average Pass Rates by Treatment Arm and Department" width="100%" />
<p class="caption">(\#fig:advpivot4)Average Pass Rates by Treatment Arm and Department</p>
</div>

This has all the elements of a good figure, but is it possible to improve it in any way? Let's think about our goal for this analysis. What do we want a reader to take away from this figure? Ideally, the reader should be able to look at different departments and see how the treatment effect varies by department. This is possible, but it takes a bit of work. For example, The "Control" bar for the ACCT department is pretty far away from the the "Instructor Incentives" bar for the ACCT department. It would be much easier to quickly understand the treatment effect if the two bars were adjacent.

To make the bars adjacent, we can switch "DepartmentCode" to the horizontal Axis, and put "TreatmentArm" in the Legend(Series). In other words, the Pivot Chart fields should look like the fields below 

<div class="figure" style="text-align: center">
<img src="images/01_adv_pivot5.png" alt="Pivot Chart Fields" width="40%" />
<p class="caption">(\#fig:advpivot5)Pivot Chart Fields</p>
</div>

To complete the figure we just need to give it a more descriptive title and correct the horizontal axis label, which is no longer Treatment Arm. Figure \@ref(fig:advpivot7) displays our final product.

<div class="figure" style="text-align: center">
<img src="images/01_adv_pivot7.png" alt="Average Pass Rates by Treatment Arm and Department" width="100%" />
<p class="caption">(\#fig:advpivot7)Average Pass Rates by Treatment Arm and Department</p>
</div>

Now it is easy for a reader to discern the treatment effect for every department. The general lesson here is to think hard about how your information displayed. Just because all of the information is there, doesn't mean it is necessarily easily digestible.

## Conclusion {#S:Conclusion}

In this module, we studied whether instructor incentives are effective in improving student performance. Using experimental data from Brownback and Sadoff (2020), we found that instructors that receive financial bonuses for each student that passes a course leads to significant increases in passing rates. However, the effects varied dramatically by department, with some departments showing enormous effects and others negligible effects. This is only part of the analysis in Brownstone and Sadoff (2020). In this concluding section, let's talk about a few other results from their work

So far, we have found performance increases in the course that is incentivized by financial incentives. But is there a cost to this increase in performance. For example, maybe instructors respond to the incentives by increasing the workload in their course. This may improve students performance in the course, but it may come at the cost of neglecting other courses. Therefore, it could be that the treatment does not actually increase performance overall, but simply forces students to spend more time in one class relative to another.

However, Brownback and Sadoff (2020) collect grades for all courses a student is enrolled in, not just the courses in the experiment. In contrast to the hypothesis above, the authors find student outcomes in the treatment improve **in all courses**. This suggests positive spillovers of the treatment. Improved performance in one course leads to improved performance in others. If students feel overwhelmed by poor grades in one course they may "give up" on the rest of their courses. Therefore, a treatment that increases performance in a single course has the scope to increase performance in all courses. 

This analysis shows evidence of positive effects, but only in the short-term. Our real goal is to improve graduate rates. Again, the richness of the data in Brownback and Sadoff (2020) will come in handy here. The authors find that students in the treatment are about 2.8 percentage points more likely to transfer to a 4-year university than control students. This represents a 28 percent increase in the probability of transferring. Overall, this suggests financial incentives to instructors may be a particularly cost effective way for community colleges to achieve a number of important goals 

We have focused on financial incentives for instructors, but maybe providing  bonuses for students is even more effective. During the experiment, the authors  offered free tuition for one summer course (face value of \$400) if they passed the test. Interestingly, the authors find this intervention had no impact on student performance

To conclude, this paper asks an important question: how can we improve student performance in community colleges? In particular, are financial incentives for instructors effective? Before this paper, we had no clear answer to this question. Prior work has focused on other settings and had found differing results. By running a carefully designed experiment, the authors can convincingly answer this question. Financial incentives cannot only increase short-run performance, but also increase long-term outcomes, such as overall course completion and transfer rates to 4-year universities.









