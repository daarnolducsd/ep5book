## Create a gif


setwd("/Users/davidarnold/Dropbox/Teaching/EP5Bookdown/gifs")

library(ggplot2)
library(gganimate)
goo <- ggplot(mtcars, aes(factor(cyl), mpg)) + 
  geom_boxplot() + 
  # Here comes the gganimate code
  transition_states(
    gear,
    transition_length = 2,
    state_length = 1
  ) +
  enter_fade() + 
  exit_shrink() +
  ease_aes('sine-in-out')

anim_save("examplegif.gif", goo)
