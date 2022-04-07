source(here("plot_schema_update", "data.R"))
source(here("plot_schema_update", "style.R"))

city_that_pop_is_in_my_range %>% 
  ggplot() +
  aes(
    x = city_name,
    y = inst_per_pop
  ) +
  geom_bar(
    stat = "identity",
    width = 0.7,
    fill = I(ifelse(
      city_that_pop_is_in_my_range$inst_per_pop == max(city_that_pop_is_in_my_range$inst_per_pop),
      "#3C145A",
      "#D2B4E9"))
  ) +
  geom_text(
    aes(
      label = paste0(round(100*inst_per_pop), "%")
    ) ,
    nudge_y = 0.0085,
    fontface = "bold",
    size= s_geom_text,
    color = c("gray1",rep("gray50", 7))
  ) +
  annotate(
    "text",
    x = 6.2,
    y = 0.3775,
    label = t_title,
    size = 34,
    fontface = "bold"
  ) +
  annotate(
    "text",
    x = 4,
    y = 0.34,
    label = t_sub_title,
    size = 12
  ) +
  labs(
    #title = t_title,
    #subtitle = t_sub_title,
    y = t_y_axis,
    x = t_x_axist,
    caption = t_caption,
    color = "",
    fill = "",
    size = ""
  )  +
  scale_x_discrete(
    expand = c(0.06, 0.06)
    ) +
  scale_y_continuous(
    expand = c(0, 0),
    limits = c(0, 0.42),
    breaks = seq(0, 0.42, 0.05),
    labels = c("0%", rep("", length(seq(0, 0.42, 0.05)[-1])))
  ) + 
  coord_cartesian(clip = 'off') +
  bester_style_heb

