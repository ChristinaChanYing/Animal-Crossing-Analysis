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
library(haven)
library(tidyverse)

# Read in the raw data.
readr::local_edition(1)
raw_data <- readr::read_csv("inputs/data/data_640_validated.csv") |>
  rename(
    A1.1 = A1_1,
    A1.2 = A1_2
  )

data_description <- read_excel("inputs/data/Data description_validated.xlsx", sheet = 1)


# Delete first two columns of raw_data
raw_data[ , c(1, 2)] <- list(NULL)


#### Save Cleaned Data ####
write_csv(raw_data, "inputs/data/cleaned_data.csv")
write_csv(data_description, "inputs/data/cleaned_data_description.csv")


         