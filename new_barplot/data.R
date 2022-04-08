pacman::p_load(
  data.table,
  tidyverse,
  openxlsx,
  ggtext,
  lubridate,
  skimr,
  DT,
  ggsci,
  gapminder,
  here,
  gt,
  forcats,
  ggeasy,
  shiny,
  ggpubr,
  stringi,
  visdat)


dt <- 
  as.data.table(
    gapminder::gapminder
  )

data_for_plot <- 
  dt[year %in% c(1952,2007)][,.(mean_lifeExp = mean(lifeExp)), by = .(continent, year)]

data_for_plot$continent <- 
  forcats::fct_reorder(
    data_for_plot$continent,
    -data_for_plot$mean_lifeExp
  )

data_for_plot$year <- 
  factor(
    data_for_plot$year,
    levels = c("1952", "2007"),
    #levels = c("2007", "1952"),
    ordered=TRUE
  )

continent_fills <- 
  data.table(
    continent = unique(data_for_plot$continent),
    fill = pal_npg("nrc")(5)
  )

data_for_plot <- 
  data_for_plot %>% 
  merge(
    continent_fills,
    by = "continent"
  )
