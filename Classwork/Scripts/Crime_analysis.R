library(tidyverse)
library(janitor)

crimes <- read_csv("Classwork/Data/Offenses_Known_to_Law_Enforcement_by_State_by_City_2019.csv")
crimes <- crimes %>% clean_names()

crimes %>% select(state, city, population) %>% 
  arrange(desc(population))

crimes %>% filter(state == "NEW YORK") %>% 
  select(state, city, population, violent_crime) %>% 
  arrange(desc(violent_crime))

crimes %>% group_by(state) %>% 
  summarise(sum_pop = sum(population)) %>% 
  arrange(desc(sum_pop))

crimes %>% filter(population > 100000) %>%
  mutate(murder_rate = murder_and_nonnegligent_manslaughter/population*100000) %>% 
  select(state, city, murder_and_nonnegligent_manslaughter, population, murder_rate) %>% 
  arrange(desc(murder_rate))

# Which city (> 100000) had the highest rate in violent_crime?
# Detroit, Mi

crimes %>% filter(population > 100000) %>% 
  mutate(violent_crime_rate = violent_crime/population*100000) %>%
  select(state, city, population, violent_crime, violent_crime_rate) %>% 
  arrange(desc(violent_crime_rate))

# How many motor vehicle thefts have there been in total?
# 509,055

crimes %>% filter(!is.na(motor_vehicle_theft)) %>%
  summarise(total_motor_thefts = sum(motor_vehicle_theft))

# How many cities have more than 50 murders? 
# 34

crimes %>% filter(murder_and_nonnegligent_manslaughter > 50)
