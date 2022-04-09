# plot parmeters
## size for text
s_title = 10.5
s_s_title = 10
s_x_axis = 12
s_y_axis = 12
s_x_axis_title = 14
s_y_axis_title = 14
s_geom_text = 8
s_caption = 12
s_legend = 10
s_legend_title = 12



## text for plot
t_title = ("רוצים מנוע גדול? תצטרכו לבקר הרבה בתחנת הדלק")
t_sub_title = ("נתוני רכב עדכניים")
t_x_axist = "גודל מנוע"
t_y_axis = "קלימטרים לליטר דלק"
t_caption = ('מקור: הלשכה המרכזית לסטטיסטיקה, וניתוח אופיר בצר')
t_color = "זמן לרבע מייל"

# color for text
t_genral_color = "gray40"

t_title = stringi::stri_reverse(t_title)
t_sub_title = stringi::stri_reverse(t_sub_title)
t_x_axist = stringi::stri_reverse(t_x_axist)
t_y_axis = stringi::stri_reverse(t_y_axis)
t_caption = stringi::stri_reverse(t_caption)
t_color = stringi::stri_reverse(t_color)



## dim for plot margin
pm_dims <- c(30,30,7.5,30)

## axis size & style
### ggesay
ggesay_options <- c("ticks", "line", "text", "title")
ggesy_x_axis <- ggesay_options[c(1)]
ggesy_y_axis <- ggesay_options[c(1)]

## styling
### betser_style
bester_style_heb <- 
  theme_classic() +
  easy_remove_y_axis(what = ggesy_y_axis) +
  easy_remove_x_axis(what = ggesy_x_axis) +
  theme(
    plot.title = 
      element_text(
        size = s_title, hjust = 1, 
        color = "black", face = "bold"
      ),
    plot.subtitle = 
      element_text(
        size = s_s_title, hjust = 1, 
        color = "black", face = "bold"   
      ),
    axis.text.x = 
      element_markdown(
        size = s_x_axis, 
        color = c("gray1",rep("gray50", 7)),
        face = "bold"
      ),
    axis.text.y = 
      element_text(
        size = s_y_axis, 
        color = "black", face = "bold"
      ),
    plot.caption = 
      element_text(
        size = s_caption, 
        color = "black", face = "bold"
      ),
    legend.text = 
      element_text(
        size = s_caption, 
        color = "black"
      ),
    axis.line = element_line(colour = "gray10", size = 1.7),
    legend.background = element_rect(fill = NA, colour = "black", linetype = "solid"),
    panel.grid.major.y = element_line(size=0.9, colour = "gray90"),
    legend.position = "none",
    plot.margin = margin(pm_dims)
  )


point_style_heb <- 
  theme_classic() +
  easy_remove_y_axis(what = ggesy_y_axis) +
  easy_remove_x_axis(what = ggesy_x_axis) +
  theme(
    plot.title = 
      element_text(
        size = s_title, hjust = 1, 
        color = "black", face = "bold"
      ),
    plot.subtitle = 
      element_text(
        size = s_s_title, hjust = 1, 
        color = "black", face = "bold"   
      ),
    axis.text.x = 
      element_markdown(
        size = s_x_axis, 
        color = "black",
        face = "bold"
      ),
    axis.text.y = 
      element_text(
        size = s_y_axis, 
        color = "black", face = "bold"
      ),
    axis.title = 
      element_text(
        size = s_x_axis_title, 
        color = "black", face = "bold"
      ),
    
    plot.caption = 
      element_text(
        size = s_caption, 
        color = "black", face = "bold"
      ),
    legend.text = 
      element_text(
        size = s_legend, 
        color = "black", 
        face = "bold"
      ),
    legend.title = 
      element_text(
        size = s_legend_title, 
        color = "black", 
        face = "bold",
        angle = 90
      ),
    
    # horizantal
    ##legend.key.height= unit(0.325, 'cm'),
    ##legend.key.width= unit(5, 'cm'),
    
    # vertecal
    legend.key.height= unit(3, 'cm'),
    legend.key.width= unit(0.3, 'cm'),
    
    
    axis.line = element_line(colour = "gray10", size = 1),
    legend.background = element_rect(fill = NA, colour = NA),
    panel.grid.major.x = element_line(size=0.9, colour = "gray90"),
    panel.grid.major.y = element_line(size=0.9, colour = "gray90"),
    legend.position = "right",
    plot.margin = margin(pm_dims),
    plot.caption.position = "plot"
  )
