
if (!require(rslurm)) {
  install.packages("rslurm")
  library(rslurm)
}

library(tidyverse)

apsim <- read_csv("./data/wheat.Report.csv")

#fahrenheit_to_kelvin <- function(temp_F) {
#  temp_K <- ((temp_F - 32) * (5 / 9)) + 273.15
#  return(temp_K)
#}

big_yield <- filter(apsim, Yield >= 4000)

if (nrow(big_yield) >= 1) {
  write_csv(big_yield, "./data/big_yield.csv")
}

