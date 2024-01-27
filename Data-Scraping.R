tiktok_data<-read.csv('./2023H1_raw_data_law_English.csv')

library(tidyverse) # must load the package first

# %>% is other option for piping

# subsetting
australia <- tiktok_data |>
  filter(location_value=="Australia")

# finding class of object
print(class(tiktok_data$location_value))
print(mean(australia$result))

