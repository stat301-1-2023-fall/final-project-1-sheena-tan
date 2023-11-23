
# install packages
library(tidyverse)
library(ggthemes)
library(patchwork)
library(cowplot)

# read in data
ctec_data_raw <- read.csv("data/ctec_data.csv")

# data cleaning
ctec_data <- ctec_data_raw |> 
  # consider empty strings as missing values
  mutate(
    school = na_if(school, ""),
    dept = na_if(dept, ""),
    course_term = na_if(course_term, ""),
    instructor = na_if(instructor, "")
  ) |> 
  # fill in missing values from the nearest value above
  fill(school, dept, course_num, course_term, instructor, inst_rating, 
       course_rating, learn_rating, challenge_rating, interest_rating, 
       hours_spent, .direction = "down")

# check for missingness
ctec_data |> summarise(across(everything(), ~ sum(is.na(.))))

