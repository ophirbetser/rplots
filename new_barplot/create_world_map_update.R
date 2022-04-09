global_plot_data <- fread("new_barplot/global_plot_data.csv")

map_regions <- 
global_plot_data %>%
  ggplot(aes(x = x, y = y, fill = region, color = region)) +
  geom_tile(color = "white", show.legend = F) +
  scale_fill_npg(guide = "none") +
  scale_y_reverse() +
  coord_equal() +
  theme_void()

map_regions
