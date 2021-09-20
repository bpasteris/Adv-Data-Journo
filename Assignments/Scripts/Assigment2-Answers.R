#### ASSIGNMENT 2 ####

# Answer the following questions using the dispatch.csv file 
# and the tidyverse functions we've learned 


# Question 1: What's the timeframe that this dataset covers?  

# Your code: dispatch %>% select(CallDateTime) %>% arrange(CallDateTime) and dispatch %>% select(CallDateTime) %>% arrange(desc(CallDateTime))

# Shorter code: dispatch %>% summarise(time_frame = range(CallDateTime))


# The answer: 6 days, 8/23 to 8/29




# Question 2: Which day of the week had the most incidents? 

# Your code: dispatch %>% group_by(DOW) %>% summarise(num = n()) %>% arrange(desc(num))




# The answer: Tuesday




# Question 3:  Which hour of the day had the most incidents?

# Your code: dispatch %>% group_by(Hour) %>% summarise(num = n()) %>% arrange(desc(num))




# The answer: 13




# Question 4:  Which police district had the most traffic stops?

# Your code: dispatch %>% filter(ExtNatureDisplayName == "TRAFFIC STOP") %>% group_by(PolArea) %>% summarise(num = n()) %>% arrange(desc(num))




# The answer: 50E





# Question 5:  What's the most common reason police are dispatched to the airport? (11300 S AIRPORT DR)

# Your code: dispatch %>% filter(Address == "11300 S AIRPORT DR") %>% group_by(ExtNatureDisplayName) %>% summarise(num = n()) %>% arrange(desc(num))




# The answer: CHECK AREA