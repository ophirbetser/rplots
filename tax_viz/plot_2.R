




dt$ratio <- 
  dt$brouto / dt$sal

dt %>% 
  ggplot() +
  geom_line(
    aes(
      x = sal,
      y = ratio
    ),
    size = 1.8
  ) +
  scale_x_continuous(
    breaks = seq(0, 100000, 10000),
    labels = 
      scales::comma(
        seq(0, 100000, 10000),
        accuracy = 1,
        suffix = "₪"
      )
  ) +
  scale_y_continuous(
    limits = c(0.5,0.96),
    breaks = seq(0.5, 0.96, 0.05),
    labels = 
      scales::comma(
        100*seq(0.5, 0.96, 0.05),
        accuracy = 1,
        suffix = "%"
      )
  ) +
  annotate(
    "text",
    x = 54000,
    y = 0.9225,
    label = t_title,
    size = s_title,
    fontface = "bold"
  ) +
  annotate(
    "text",
    x = 50100,
    y = 0.8875,
    label = t_sub_title,
    size = s_s_title
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
  theme_classic() +
  point_style_heb

