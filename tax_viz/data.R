pacman::p_load(
  data.table,
  tidyverse,
  scales,
  openxlsx,
  ggtext,
  lubridate,
  skimr,
  DT,
  here,
  gt,
  forcats,
  ggeasy,
  shiny,
  ggpubr,
  stringi,
  visdat)

tax_per_sal <- function(sal){
  if(sal %between% c(0, 6450)){
    income_tax <- 
      sal * 0.10
  } else if(sal %between% c(6450, 9240)){
    income_tax <- 
      (6450 * 0.10) +
      ((sal - 6450) * 0.14)
  } else if(sal %between% c(9240, 14840)){
    income_tax <- 
      (6450 * 0.10) +
      ((9240 - 6450) * 0.14) +
      ((sal - 9240) * 0.20) 
  } else if(sal %between% c(14840, 20620)){
    income_tax <- 
      (6450 * 0.10) +
      ((9240 - 6450) * 0.14) +
      ((14840 - 9240) * 0.20) +
      ((sal - 14840) * 0.31) 
  }  else if(sal %between% c(20620, 42910)){
    income_tax <- 
      (6450 * 0.10) +
      ((9240 - 6450) * 0.14) +
      ((14840 - 9240) * 0.20) +
      ((20620 - 14840) * 0.31) +
      ((sal - 20621) * 0.35) 
  } else if(sal %between% c(42910, 55270)){
    income_tax <- 
      (6450 * 0.10) +
      ((9240 - 6450) * 0.14) +
      ((14840 - 9240) * 0.20) +
      ((20620 - 14840) * 0.31) +
      ((42910 - 20620) * 0.35) +
      ((sal - 42910) * 0.47) 
  } else if(sal > 55270){
    income_tax <- 
      (6450 * 0.10) +
      ((9240 - 6450) * 0.14) +
      ((14840 - 9240) * 0.20) +
      ((20620 - 14840) * 0.31) +
      ((42910 - 20620) * 0.35) +
      ((55270 - 42910) * 0.47) +
      ((sal - 55270) * 0.50) 
  }
  
  return(income_tax)
}

bitoh_laomi <- function(sal){
  if(sal %between% c(0, 6331)){
    laomi_tax <- 
      sal * 0.004
  } else if(sal %between% c(6331, 44020)){
    laomi_tax <- 
      (6331 * 0.004) +
      ((sal - 6331) * 0.07)
  } else if(sal > 44020){
    laomi_tax <- 
      (6331 * 0.004) +
      ((44020 - 6331) * 0.07)
  }
  
  return(laomi_tax)
}

health_tax <- function(sal){
  if(sal %between% c(0, 6331)){
    health <- 
      sal * 0.031
  } else if(sal %between% c(6331, 44020)){
    health <- 
      (6331 * 0.031) +
      ((sal - 6331) * 0.05)
  } else if(sal > 44020){
    health <- 
      (6331 * 0.031) +
      ((44020 - 6331) * 0.05)
  }
  
  return(health)
}


sal <- seq(0, 80000, 10)
inc_tax <- 
  purrr::map_dbl(
    sal,
    ~ tax_per_sal(.x)
  )
luomi_tax <- 
  purrr::map_dbl(
    sal,
    ~ bitoh_laomi(.x)
  )
health_tax <- 
  purrr::map_dbl(
    sal,
    ~ health_tax(.x)
  )


dt <- 
  data.table(
    sal = sal,
    inc_tax = inc_tax,
    luomi_tax = luomi_tax,
    health_tax = health_tax,
    brouto = (sal - inc_tax - luomi_tax - health_tax)
  )

dt$inc_tax_rate <- 
  fcase(
    dt$sal %between% c(0, 6450), 0.10,
    dt$sal %between% c(6450, 9240), 0.14,
    dt$sal %between% c(9240, 14840), 0.20,
    dt$sal %between% c(14840, 20620), 0.31,
    dt$sal %between% c(20620, 42910), 0.35,
    dt$sal %between% c(42910, 55270), 0.47,
    dt$sal > 55270, 0.50
  )

dt %>% 
  ggplot() +
  geom_point(
    aes(
      x = sal,
      y = brouto
    ) 
  ) +
  geom_point(
    aes(
      x = sal,
      y = sal
    ),
    color = "red"
  ) +
  scale_x_continuous(
    breaks = seq(0, 100000, 5000)
  ) +
  scale_y_continuous(
    breaks = seq(0, 100000, 5000)
  ) +
  theme_classic() +
  theme(
    panel.grid.major.x = element_line(size=0.9, colour = "gray90"),
    panel.grid.major.y = element_line(size=0.9, colour = "gray90")
  ) + coord_equal()

