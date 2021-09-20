## LOAD TIDYVERSE AND THE DATA FILE



## INTEGRITY CHECKS

# Is any individual in here twice? Why?
# library(janitor)
# salaries <- salaries %>% clean_names()

# How many years of data do we have?
# 9 years, 2011 to 2020
# salaries %>% mutate(Year = substr(fiscal_year, 3, 6)) %>% select(Year) %>% arrange((Year)
# salaries %>% mutate(Year = substr(fiscal_year, 3, 6)) %>% select(Year) %>% arrange(desc(Year))

# What's the min and max annual salary given out in 2020? 
# $0 and $275,000
# salaries %>% filter(fiscal_year == "FY2020") %>% select(annual_salary, fiscal_year) %>% arrange(annual_salary)
# salaries %>% filter(fiscal_year == "FY2020") %>% select(annual_salary, fiscal_year) %>% arrange(desc(annual_salary))

# What jobs get paid $0?
# Aide blue chip, Community health nurse I and II, election judge (regular), Recreation leader II, and School health aide
# salaries %>% filter(annual_salary == 0) %>% group_by(job_title) %>% summarise(num = n())

# How clean are the job titles? Are there a lot of duplicates? 

# Clean up the JobTitles by making everything lowercase 
# (hint: use mutate to overwrite the current JobTitle field, using the function str_to_lower())

# Take a look at agency names; how clean are they? 



## QUESTIONS OF THE DATA

# Who's the highest paid employee in FY2020?
# Michael S Harrison
# salaries %>% filter(fiscal_year == "FY2020") %>% select(name, annual_salary, fiscal_year) %>% arrange(desc(annual_salary))

# Which job title has the highest average salary in 2020? (hint: use mean() )
# 911 lead operator
# salaries %>% filter(fiscal_year == "FY2020") %>% group_by(job_title) %>% summarise(mean(annual_salary))

# Any potential problems with citing these results? 

# How many people work in the police department in 2020? 
# 16,606 people
# salaries %>% filter(grepl("POLICE", job_title))

# How many are "police officers"? 
# 13,656 people
# salaries %>% filter(grepl("POLICE OFFICER", job_title))

# What was their total salary?
# $839,372385
# salaries %>% filter(grepl("POLICE OFFICER", job_title)) %>% summarise(sum(annual_salary))

