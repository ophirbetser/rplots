# plot parmeters
## size
title_size = 24
subtitle_size = 18
x_axis_size = 18
y_axis_size = 18
geom_text_size = 8
caption_size = 16

## text
title_text = stringi::stri_reverse("בפארן מככבים")
subtitle_text = stringi::stri_reverse("יחס הבלה בלה בלה לנפש, פילוח לפי ערים, ישראל")
x_axis_text = ''
y_axis_text = ''
caption_text = stringi::stri_reverse('מקור: הלשכה המרכזית לסטטיסטיקה, וניתוח בלה בלה בלה')

keep_first_and_last_else_NA <- 
  function(vec){
    output <- rep("", length(vec))
    output[1] <- vec[1]
    output[length(vec)] <- vec[length(vec)]
    
    return(output)
  }


bester_style <- 
  theme_classic() +
  easy_remove_y_axis(what = c("line", "ticks")) +
  easy_remove_x_axis(what = c("ticks")) +
  theme(
    plot.title = 
      element_text(
        size = title_size, hjust = 1, 
        color = "black", face = "bold"
      ),
    plot.subtitle = 
      element_text(
        size = subtitle_size, hjust = 1, 
        color = "black", face = "bold"   
      ),
    axis.text.x = 
      element_markdown(
        size = x_axis_size, 
        color = c("gray1",rep("gray50", 7)),
        face = "bold"
      ),
    axis.text.y = 
      element_text(
        size = y_axis_size, 
        color = "black", face = "bold"
      ),
    plot.caption = 
      element_text(
        size = caption_size, 
        color = "black", face = "bold"
      ),
    legend.text = 
      element_text(
        size = caption_size, 
        color = "black"
      ),
    axis.line = element_line(colour = "black", size = 1.3),
    legend.background = element_rect(fill = NA, colour = "black", linetype = "solid"),
    panel.grid.major.y = element_line(size=0.9, colour = "gray90"),
    legend.position = "none",
    plot.margin = margin(c(15,30,10,0))
  )
