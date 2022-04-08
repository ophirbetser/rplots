source(here("new_barplot", "data.R"))
source(here("new_barplot", "create_world_map.R"))
source(here("new_barplot", "style.R"))

data_for_plot %>% 
  ggplot(
    aes(
      x = continent,
      y = mean_lifeExp,
      fill = year
    )
  ) +
  geom_bar(
    stat = "identity",
    position = position_dodge2(preserve = "single"),
    width = 0.8
    ) +
  annotation_custom(
    ggplotGrob(map_regions),
    xmin = 3.6, 
    xmax = 6,
    ymin = 60,
    ymax = 95
  ) +
  scale_x_discrete(
    expand = c(0.1, 0.1)
    ) +
  scale_y_continuous(
    expand = c(0, 0),
    limits = c(0, 87),
    breaks = seq(0, 87, 5),
    labels = seq(0, 87, 5)
  ) + 
  labs(
    title = t_title,
    subtitle = t_sub_title,
    y = t_y_axis,
    x = t_x_axist,
    caption = t_caption,
    color = "",
    fill = "",
    size = ""
  )  +
  coord_cartesian(clip = 'off') +
  bester_style_eng


