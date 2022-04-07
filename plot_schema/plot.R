source(here("plot_schema", "data.R"))
source(here("plot_schema", "style.R"))

city_that_pop_is_in_my_range %>% 
  ggplot() +
  aes(
    x = city_name,
    y = inst_per_pop
  ) +
  geom_bar(
    stat = "identity",
    width = 0.8,
    fill = I(ifelse(
      city_that_pop_is_in_my_range$inst_per_pop == max(city_that_pop_is_in_my_range$inst_per_pop),
      "#3C145A",
      "#D2B4E9"))
  ) +
  geom_text(
    aes(
      label = paste0(round(100*inst_per_pop), "%")
    ) ,
    nudge_y = 0.009,
    fontface = "bold",
    size= geom_text_size,
    color = c("gray1",rep("gray50", 7))
  ) +
  annotate(
    "text",
    x = 6.8,
    y = 0.42,
    label = title_text,
    size = 24,
    fontface = "bold"
  ) +
  annotate(
    "text",
    x = 5.75,
    y = 0.3825,
    label = subtitle_text,
    size = 12
  ) +
  labs(
    #title = title_text,
    #subtitle = subtitle_text,
    y = x_axis_text,
    x = y_axis_text,
    caption = caption_text,
    color = "",
    fill = "",
    size = ""
  )  +
  scale_y_continuous(expand = c(0, 0),
                     limits = c(0, 0.45),
                     breaks = seq(0, 0.45, 0.05),
                     labels = 
                     paste0(keep_first_and_last_else_NA(seq(0, 45, 5)), keep_first_and_last_else_NA(rep("%", length(seq(0, 45, 5)))))
  ) + 
  coord_cartesian(clip = 'off') +
  bester_style
