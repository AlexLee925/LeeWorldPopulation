library(tidyverse)
library(readxl)

ESTIMATES <- read_excel('data-raw/World_Population.xlsx', sheet=1, range="A17:BZ306")

WorldPopulation <- ESTIMATES %>% filter(Type=="Country/Area") %>%
select(3, 8:78) %>%
  mutate(CountryName=`Region, subregion, country or area *`) %>%
  select(73, 2:72) %>%
  as.data.frame()
head(WorldPopulation)

usethis::use_data(WorldPopulation, overwrite=TRUE)
