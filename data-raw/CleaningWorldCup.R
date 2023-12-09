library(tidyverse)
library(rvest)

url <- 'https://en.wikipedia.org/wiki/FIFA_World_Cup'
page <- read_html(url)
WorldCupTable <- page %>%
  html_nodes('table') %>%
  .[[4]] %>%
  html_table(header=FALSE, fill=TRUE)
WorldCupTable <- WorldCupTable %>% as.data.frame()
head(WorldCupTable)

WorldCupData <- WorldCupTable %>%
  mutate(Year=X1, Hosts=X2, Matches=X5, Totalattendance=X4, Averageattendance=X6)%>%
  select(Year, Hosts, Matches, Totalattendance, Averageattendance) %>%
  slice(3:24)

HostsColumn <- WorldCupData[, 'Hosts']
YearColumn <- WorldCupData[, 'Year']
WorldCupDataJoin <- str_c( HostsColumn, YearColumn)
WorldCupData2 <- cbind(WorldCupData, WorldCupDataJoin)
World_Cup <- WorldCupData2 %>% mutate(WorldCup=WorldCupDataJoin) %>%
  select(WorldCup, Matches, Totalattendance, Averageattendance)

usethis::use_data(World_Cup, overwrite=TRUE)
