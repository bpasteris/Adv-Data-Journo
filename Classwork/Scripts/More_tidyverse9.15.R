library(tidyverse)

dispatch <- read_csv("Assignments/Data/dispatch.csv")
  
# filter more than one thing - %in% c()
dispatch %>% filter(ExtNatureDisplayName %in% c("TRAFFIC", "TRAFFIC STOP", "TRAFFIC HAZARD", "TRAFFIC OBSERVATION", "TRAFFIC CONTROL")) %>% 
  count(ExtNatureDisplayName)

# search for anything that includes whatever you're looking for/patterns - grepl
?grepl
dispatch %>% filter(grepl("TRAFFIC", ExtNatureDisplayName)) %>% count(ExtNatureDisplayName)

# Pull out part of a section of data - substr
?substr
dispatch %>% mutate(CallDate = substr(CallDateTime, 1, 9)) %>% select(CallDateTime, CallDate)
?mutate
dispatch %>% mutate(CallDate = substr(CallDateTime, 1, 9), .after = CallDateTime)
