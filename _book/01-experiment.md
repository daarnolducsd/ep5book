# Introduction to Excel

## Introduction to Experiments

Did you know that countries with higher consumption of chocolate per capita tend to win more Nobel prizes? 

<div class="figure" style="text-align: center">
<img src="images/chocolate.png" alt="Chocolate Consumption and Nobel Prizes" width="75%" />
<p class="caption">(\#fig:chocolate)Chocolate Consumption and Nobel Prizes</p>
</div>

In Figure \@ref(fig:chocolate), the number of Nobel laureates per 10 million of the population (vertical axis) is plotted against the chocolate consumption in kilograms per capita in a given year (horizontal axis). As is clear in this graph, countries with higher rates of chocolate consumption also tend to have higher rates of Nobel laureates is an example of a **correlation**. A correlation is any is any relationship between two variables.

Correlations can be very interesting. In many cases they can lead to new research questions. But they don't often answer the questions social scientists are actually interested in. We are generally interested in understanding **causal relationships** between variables. 

To understand causal relationships, let's again consider the relationship between chocolate consumption and Nobel prizes. Do you think that if the U.S. wanted to increase the number of Nobel laureates, they should invest in chocolate and include chocolate in lunch meals for students? Probably not! It's unlikely that increased chocolate consumption **causes** an individual to win a Nobel prize. In this case, it is more likely that this correlation in the data just arose due to chance. Therefore, we have uncovered a **spurious correlation**, or a correlation that arose due to chance. There are many interesting spurious correlations. If you are interested in looking through some fun spurious correlations, just follow this [link](https://www.tylervigen.com/spurious-correlations).

  - A **correlation** is any relationship between two variables, either by chance or causally 
  
- Do we really think that chocolate consumption **causes** a country to win more Nobel prizes?

  - Probably not! Therefore, in this case, we have found a **spurious correlation**, or a correlation that arose due to chance
  

- There are many spurious correlations out there 
  
  - Go to https://tylervigen.com/spurious-correlations to see some of them! 
  
- But social scientists and policymakers are often interested in inferring **causal relationships**

- If we need to decide if a given policy is worth it or not, we need to understand how it causally impacts individual's outcomes


- Imagine a high school is trying to decide whether to invest in a new after-school program designed to help students with SAT prep

- In the past, a subset of students had enrolled in a similar program offered outside of the school

- In order to try and understand the benefits of the program, the school decides to use data on past students to see if those who attended SAT prep programs outperformed students that did not.


- The school finds those who attended SAT test prep programs score much higher on the SAT than those who did not

- Does this mean the SAT test prep program works and the school should invest in one?

- Maybe, maybe not

  - It could be that the programs have a causal impact on student scores
  
  - But students that take test prep may be different from students that do not. They could vary in many dimensions: academic ability, college interest, as well as parental background 
  
- With only **observational data** it is difficult to tell which story is true


- In medicine, there is a long-established way to infer causality: the randomized control trial (RCT)

- Imagine we are testing whether a given drug reduces blood pressure 

- To study the effectiveness we recruit a group of participants 

- Half of the participants are randomly placed into the **treatment** group and given the drug 

- The other half are placed into the **control** or **placebo** group and given a placebo drug

- Now we can just compare outcomes for the two groups over time to understand the impact of the drug


- The key to a well-done experiment is **randomization**

- If who receives the treatment is completely random, then on average, the two groups will be very similar 

- For example, in our test prep example, if we could randomly split students into two groups: test prep vs. no test prep, then we could evaluate the impacts of the program 

- Since students are no longer self-selecting into the program, there should be little difference in the two groups in terms of academic ability, college interest, parental background



- Social scientists have borrowed from medicine to run experiments to answer causal questions 

- Not all questions can be answered with an experiment, but if an experiment can be done, it is hard to find more convincing evidence 

- Experiments have been particularly influential in development economics, with many projects aiming to develop policies to alleviate poverty in developing countries 

  - In 2019, Abhijit Banerjee, Esther Duflo, and Michael Kremer won the Nobel Prize in Economics "for their experimental approach to alleviating global poverty."
  
- We will be studying a number of social science experiments throughout this course


- Motivation: only 40 percent of community college students earn a college degree within 6 years (Shapiro et al. 2017)

- Question: Given poor outcomes, important to consider tools to improve performance. Is it possible financial incentives to instructors might improve teaching?

- In Brownback and Sadoff (2020) the authors run an experiment. At a community college in Indiana (Ivy Tech) some instructors (the treatment group) received \$50 for each student that passes the test, while the control group did not receive such an incentive 

- Since on average the instructors will be similar in treatment and control, any difference in performance between students must be due to the treatment


