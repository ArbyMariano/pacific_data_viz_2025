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

# Create data tables ------------------------------------------------------

# Function to filter bp2050 to a single indicator 

filter_bp2050 <- function(id) {
  bp2050 |> 
    filter(indicator_id == id)
}

malr_inci <- filter_bp2050(id = "SH_STA_MALR")
san_sage <- filter_bp2050(id = "SH_SAN_SAFE")
h20_impr <- filter_bp2050(id = "SH_H2O_IMPR")
pe_curric <- filter_bp2050(id = "BPI_MANAP1")
alc_conspt <- filter_bp2050(id = "SH_ALC_CONSPT")
sta_birth <- filter_bp2050(id = "SH_STA_BRTC")
ncd_gdl <- filter_bp2050(id = "BPI_MANAGL2")
sta_wash <- filter_bp2050(id = "SH_STA_WASH")
food_pol <- filter_bp2050(id = "BPI_MANAF5")
ncd_tskfrce <- filter_bp2050(id = "BPI_MANAL1")
ncd_strat <- filter_bp2050(id = "BPI_MANASL2")
ihr_cap <- filter_bp2050(id = "SH_IHR_CAPS")
tbs_incd <- filter_bp2050(id = "SH_TBS_INCD")
hlth_cvrg <- filter_bp2050(id = "SPC_3_8_1")
prv_smok <- filter_bp2050(id = "SH_PRV_SMOK")
h20_treated <- filter_bp2050(id = "SPC_6_3_1")
dis_death <- filter_bp2050(id = "SH_DTH_NCD")
mater_mort <- filter_bp2050(id = "SH_STA_MORT")
hiv_incd <- filter_bp2050(id = "SH_HIV_INCD")


# Analysis ----------------------------------------------------------------


