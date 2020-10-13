source(here::here('01_code/packages.R'))

## read data
co2_data <- read_csv(here::here('00_data/owid-co2-data.csv'))

## data overview 
names(co2_data)
str(co2_data)
des <- Hmisc::describe(co2_data)

## data after 1945 

co2_data_45 <- co2_data%>%
  dplyr::filter(year > 1945)





