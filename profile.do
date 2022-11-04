cd "/Users/davidarnold/Dropbox/Teaching/EP5/online/04_week/data"
use mindspark_data.dta, replace
/*load data*/ 
cd "/Users/davidarnold/Dropbox/Teaching/EP5/online/04_week/data"
use gapminder.dta, replace 
cd "/Users/davidarnold/Dropbox/Teaching/EP5/online/04_week/data"
use mindspark_data.dta, replace
/*load data*/ 
cd "/Users/davidarnold/Dropbox/Teaching/EP5/online/04_week/data"
use gapminder.dta, replace 
reg life_expectancy average_income
predict predicted_life_expectancy, xb
gen error = life_expectancy - predicted_life_expectancy
sum life_expectancy
