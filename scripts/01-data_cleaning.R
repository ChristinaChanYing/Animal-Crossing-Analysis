#### Preamble ####
# Purpose: Clean the survey data downloaded from Science Data Bank
# Author: Christina Chan-Ying
# Data: April 12, 2022
# Contact: christina.chanying@mail.utoronto.ca
# License: MIT
# Pre-requisites: None



#### Workspace setup ####
# Use R Projects, not setwd().
library(readxl)
library(tidyverse)



#### Animal Crossing players’ behaviors dataset from Science Data Bank  #### 

readr::local_edition(1)

# Read in the Survey Data
raw_data <- readr::read_csv("inputs/data/data_640_validated.csv") |>
  mutate(across(everything(), as.character)) |>
  rename(
    A1.1 = A1_1,
    A1.2 = A1_2
  )
# Delete first two columns of raw_data
raw_data[ , c(1, 2)] <- list(NULL)

# transpose survey data
data <- raw_data |>
  tibble::rownames_to_column() |>
  pivot_longer(-rowname) |>
  pivot_wider(names_from=rowname, values_from=value) |>
  rename(Code = name)


# Read in the Survey Description
data_description <- read_excel("inputs/data/Data description_validated.xlsx", sheet = 1) # %>% 
#   #change `Code` column to row name
#   remove_rownames %>% 
#   column_to_rownames(var="Code") %>%
#   #transpose
#   tibble::rownames_to_column() %>%  
#   pivot_longer(-rowname) %>%
#   pivot_wider(names_from=rowname, values_from=value) %>% 
#   #change `name` column to row name
#   remove_rownames %>% 
#   column_to_rownames(var="name")


#### Save Cleaned Data ####
# write_csv(raw_data, "inputs/data/cleaned_data.csv") #original data

write_csv(data, "inputs/data/cleaned_data.csv") #transposed data

write_csv(data_description, "inputs/data/cleaned_data_description.csv")



#### Animal Crossing - New Horizons Dataset from tidytuesday #### 
# Read in the raw data 
# critic <- readr::read_tsv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-05-05/critic.tsv')
# user_reviews <- readr::read_tsv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-05-05/user_reviews.tsv')
# items <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-05-05/items.csv')
# villagers <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-05-05/villagers.csv')



         