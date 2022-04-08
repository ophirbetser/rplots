# plot parmeters
## size for text
s_title = 32
s_s_title = 22
s_x_axis = 22
s_y_axis = 18
s_geom_text = 8
s_caption = 16

## text for plot
t_title = "Life Exp per Continent"
t_sub_title = "past vs. today (1952 - 2007)"
t_x_axist = ""
t_y_axis = ""
t_caption = "source: gapminder (R package)"

# color for text
t_genral_color = "gray40"

#t_title = stringi::stri_reverse(t_title)
#t_sub_title = stringi::stri_reverse(t_sub_title)
#t_x_axist = stringi::stri_reverse(t_x_axist)
#t_y_axis = stringi::stri_reverse(t_y_axis)
#t_caption = stringi::stri_reverse(t_caption)

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

bester_style_eng <- 
  theme_classic() +
  easy_remove_y_axis(what = ggesy_y_axis) +
  easy_remove_x_axis(what = ggesy_x_axis) +
  theme(
    ## text
    plot.title = 
      element_text(
        size = s_title,
        hjust = 0, 
        color = t_genral_color,
        face = "bold"
      ),
    plot.subtitle = 
      element_text(
        size = s_s_title,
        hjust = 0.025, 
        color = t_genral_color,
        face = "bold"   
      ),
    axis.text.x = 
      element_markdown(
        size = s_x_axis, 
        color = t_genral_color,
        face = "bold"
      ),
    axis.text.y = 
      element_text(
        size = s_y_axis, 
        color = t_genral_color,
        face = "bold"
      ),
    plot.caption = 
      element_text(
        size = s_caption, 
        color = t_genral_color,
        face = "bold"
      ),
    legend.text = 
      element_text(
        size = s_caption, 
        color = "black"
      ),
    
    ## axis
    axis.line = 
      element_line(
        colour = "gray10",
        size = 1.7
        ),
    
    ## legend
    legend.background = 
      element_rect(
        fill = NA, 
        colour = "black",
        linetype = "solid"
        ),
    
    legend.position = "none",
    
    ## panel
    panel.grid.major.y = 
      element_line(
        size=0.9, 
        colour = "gray90"
        ),
    
    ## margin
    plot.margin = margin(pm_dims)
  )
