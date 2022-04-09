source(here("schater_plot", "data.R"))
source(here("schater_plot", "style.R"))

data_per_plot %>% 
  ggplot() +
  aes(
    x = hp,
    y = mpg,
    color = qsec
  ) +
  geom_point(
    size = 3,
    alpha = 0.8
  ) +
  scale_colour_gradient(
    low = "blue",
    high = "red",
    na.value = NA
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
    color = t_color,
    fill = "",
    size = ""
  )  +
  scale_x_continuous(
    expand = c(0, 0),
    limits = c(0, 360),
    breaks = seq(0, 360, 50),
  ) + 
  scale_y_continuous(
    expand = c(0, 0),
    limits = c(0, 37),
    breaks = seq(0, 37, 5),
  ) + 
  guides(
    color = guide_colourbar(
      title.position = "left",
      title.hjust = 0.5,
      
      ticks = FALSE
    )
  ) +
  point_style_heb
  

