#link to census data:
'https://shiny.rstudio.com/tutorial/written-tutorial/lesson5/census-app/data/counties.rds'
#link to helpers.r:
'https://shiny.rstudio.com/tutorial/written-tutorial/lesson5/census-app/helpers.R'

#to get the percent maps function, source helpers.r
library(maps)
library(mapproj)
source('C:\\Users\\Ariel\\Desktop\\census_example_reactive\\helpers.R')

counties <- readRDS("C:\\Users\\Ariel\\Desktop\\census_example_reactive\\data\\counties.rds")