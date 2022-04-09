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
    levels = c("2007", "1952"),
    ordered=TRUE
  )

#show_col(pal_npg("nrc")(10))
data_for_plot$continent_fill <- 
fcase(
  data_for_plot$continent == "Asia", "#00A087FF",
  data_for_plot$continent == "Europe", "#8491B4FF",
  data_for_plot$continent == "Africa", "#DC0000FF",
  data_for_plot$continent == "Americas", "#3C5488FF",
  data_for_plot$continent == "Oceania", "#4DBBD5FF",
  default = NA
)

