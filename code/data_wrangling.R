# Install packages if you don't have it -----------------------------------

# install.packages("tidyverse")
# install.packages("janitor")

# Load packages -----------------------------------------------------------

library(tidyverse)
library(janitor)

# Import data -------------------------------------------------------------

bp2050 <- read_csv("data_raw/bp2050.csv") |> 
  clean_names()

# Clean variables names ---------------------------------------------------

bp2050 <- bp2050 |> 
  rename(action_id = action,
         freq_id = freq,
         indicator_id = indicator,
         sex_id = sex,
         age_id = age,
         urbanization_id = urbanization,
         income_id = income,
         education_id = education,
         occupation_id = occupation,
         composite_breakdown_id = composite_breakdown,
         disability_id = disability,
         unit_measure_id = unit_measure,
         reporting_type_id = reporting_type,
         nature_id = nature
         )

bp2050 <- bp2050 |> 
  rename_with(~ gsub("_2","_label", .x, fixed = TRUE))

