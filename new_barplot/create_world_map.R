
## get data
devtools::source_gist("https://gist.github.com/Z3tt/301bb0c7e3565111770121af2bd60c11")

## tile map as legend
map_regions <-
  df_ratios %>%
  mutate(region = fct_reorder(region, -student_ratio_region)) %>%
  ggplot(aes(x = x, y = y, fill = region, color = region)) +
  geom_tile(color = "white") +
  scale_y_reverse() +
  #scale_fill_gradient(na.value = NA) +
  scale_fill_npg(guide = "none") +
  coord_equal() +
  theme_light() +
  theme(
    line = element_blank(),
    panel.background = element_rect(fill = "transparent"),
    plot.background = element_rect(fill = "transparent",
                                   color = "transparent"),
    panel.border = element_rect(color = "transparent"),
    strip.background = element_rect(color = "gray20"),
    axis.text = element_blank(),
    plot.margin = margin(0, 0, 0, 0)
  ) +
  labs(x = NULL, y = NULL)

map_regions

#?scale_fill_uchicago