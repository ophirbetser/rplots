pacman::p_load(
  data.table,
  tidyverse,
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


city_that_pop_is_in_my_range <-
  data.table::data.table(
    city_name = c("כפר האורנים",
                  "מעלה גמלא","משואה",
                  "נתיב הגדוד","עין יהב",
                  "פארן","צופר","תומר"),
    pop_total = c(61L,559L,
                  180L,222L,771L,508L,
                  466L,287L),
    sum_inst = c(16L,122L,
                 34L,40L,165L,192L,126L,
                 55L),
    inst_per_pop = c(0.262295081967213,0.21824686940966,
                     0.188888888888889,
                     0.18018018018018,
                     0.214007782101167,
                     0.377952755905512,0.270386266094421,
                     0.191637630662021)
  )

# reverse city_name to fit heb format
city_that_pop_is_in_my_range$city_name <- 
  stri_reverse(city_that_pop_is_in_my_range$city_name)

# order by `inst_per_pop`
city_that_pop_is_in_my_range$city_name <- 
  forcats::fct_reorder(
    city_that_pop_is_in_my_range$city_name,
    -city_that_pop_is_in_my_range$inst_per_pop
  )

city_that_pop_is_in_my_range <- 
city_that_pop_is_in_my_range[order(-inst_per_pop)]