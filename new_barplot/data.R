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
    ordered=TRUE
  )
