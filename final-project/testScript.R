library_survey <- read.csv("./final-project/library-survey-2021.csv")
pen_index <- read.csv("./final-project/pen-index-2023.csv")
school_districts <- read.csv("final-project/sdlist-23.csv")

library(dplyr)
library(stringr)

# Convert 'District' and 'CNTY' columns to lowercase
pen_index <- pen_index %>% 
  mutate(school_district = tolower(District))

school_districts <- school_districts %>%
  mutate(school_district = tolower(School.District.Name)) %>%
  mutate(County_Merge = tolower(County.Names))

library_survey <- library_survey %>%
  mutate(County_Merge = paste(tolower(CNTY), "county", sep = " "))

# Perform cross join
pen_index_counties <- left_join(pen_index, school_districts, by = "school_district", relationship = "many-to-many")
merged <- left_join(pen_index_counties, library_survey, by = "County_Merge", relationship = "many-to-many")


# Drop the intermediate lowercase columns
merged <- select(merged, -CNTY, -County_Merge, -school_district, -Secondary.Author.s, -Illustrator.s, -Translator.s, -Series.Name)
