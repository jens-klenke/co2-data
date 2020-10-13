source(here::here('01_code/packages.R'))

## read data
co2_data <- read_csv(here::here('00_data/owid-co2-data.csv'))

# codebook
# codebook <- read_csv(here::here('00_data/owid-co2-codebook.csv'))

## data overview 
names(co2_data)
str(co2_data)
des <- Hmisc::describe(co2_data)

### G28 countries 
# 

G_28 <- c('Australia', 'Austria', 'Belgium', 'Canada', 'Denmark', 'France', 'Finland', 'Germany', 'Italy', 'Japan', 'Netherlands', 'Spain', 'Sweden', 'Switzerland', 'United Kingdom', 'United States', 'Argentina', 'Brazil', 'Chile', 'China', 'Greece', 'India', 'Indonesia', 'Mexico', 'New Zealand', 'Peru', 'Portugal', 'Taiwan')

## data after 1945 and 

co2_data_45_g28 <- co2_data%>%
  dplyr::filter(year > 1945,
                country %in% G_28)%>%
  dplyr::select(year, country, co2, population)%>%
  dplyr::mutate(co2_per_capita = co2 / (population/1000000))%>%
  dplyr::group_by(year)%>%
  dplyr::mutate(mean_co2_per_capita = mean(co2_per_capita))%>%
  dplyr::mutate(demeand_co2_per_capita = co2_per_capita - mean_co2_per_capita)


ggplot(co2_data_45_g28, aes(x = year, y = demeand_co2_per_capita, colour = country))+
  geom_line()









