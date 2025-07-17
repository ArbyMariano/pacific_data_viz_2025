# Install packages if you don't have it

# install.packages("tidyverse")

# Load packages

library(tidyverse)

# Import data

read_csv("data_raw/SPC,DF_BP50_2,1.0+all.csv") |> 
  view()
