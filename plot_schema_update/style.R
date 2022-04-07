# plot parmeters
## size for text
s_title = 24
s_s_title = 18
s_x_axis = 22
s_y_axis = 18
s_geom_text = 8
s_caption = 18

## text for plot
t_title = stringi::stri_reverse("בפארן מככבים")
t_sub_title = stringi::stri_reverse("יחס הבלה בלה בלה לנפש, פילוח לפי ערים, ישראל")
t_x_axist = ''
t_y_axis = ''
t_caption = stringi::stri_reverse('מקור: הלשכה המרכזית לסטטיסטיקה, וניתוח בלה בלה בלה')

## dim for plot margin
pm_dims <- c(15,30,5,30)

## axis size & style
### ggesay
ggesay_options <- c("ticks", "line", "text", "title")
ggesy_x_axis <- ggesay_options[c(1)]
ggesy_y_axis <- ggesay_options[c(1,2,3,4)]

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
