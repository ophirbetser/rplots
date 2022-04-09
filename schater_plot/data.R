pacman::p_load(
  data.table,
  tidyverse,
  scales,
  openxlsx,
  ggtext,
  lubridate,
  skimr,
  DT,
  here,
  gt,
  forcats,
  ggeasy,
  shiny,
  ggpubr,
  stringi,
  visdat)


data_per_plot <- mtcars

#
## reverse city_name to fit heb format
#city_that_pop_is_in_my_range$city_name <- 
#  stri_reverse(city_that_pop_is_in_my_range$city_name)
#
## order by `inst_per_pop`
#city_that_pop_is_in_my_range$city_name <- 
#  forcats::fct_reorder(
#    city_that_pop_is_in_my_range$city_name,
#    -city_that_pop_is_in_my_range$inst_per_pop
#  )
#
#city_that_pop_is_in_my_range <- 
#city_that_pop_is_in_my_range[order(-inst_per_pop)]#