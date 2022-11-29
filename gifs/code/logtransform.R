## Create a gif

rm(list=ls())
library(gifski)
library(gganimate)
setwd("/Users/davidarnold/Dropbox/Teaching/EP5Bookdown/gifs")

xstart <- c(1,2,3,4,5,6,7,8,9,10)
ystart <- 0.2*log(xstart)+1

xend <- log(xstart)
yend <- ystart 

steps <- 2 

xtotal <- rep(0,steps*length(xstart))
ytotal <- rep(0,steps*length(xstart))
step <- rep(0,steps*length(xstart))

xtotal[1:length(xstart)]=xstart
ytotal[1:length(ystart)]=ystart
step[1:length(xstart)]=1

index_x = length(xstart)+1
index_y = length(ystart)+1

for (i in 2:steps){
  
  xtotal[index_x:(index_x+length(xstart)-1)]=xstart+(xend-xstart)*((i)/steps)
  ytotal[index_y:(index_y+length(ystart)-1)]=ystart+ (yend-ystart)*((i)/steps)
  step[index_x:(index_x+length(xstart)-1)]=i
  
  index_x=index_x+length(xstart)
  index_y=index_y+length(ystart)
  
}

newdf <- as.data.frame(cbind(xtotal,ytotal,step))

library(ggplot2)
library(gganimate)
library(transformr)



goo <- ggplot(newdf, aes(x=xtotal,y=ytotal)) + 
  geom_point() + 
  geom_smooth(method="lm",se=FALSE) + 
  xlim(0,10) + 
  ylab("Y variable") + 
  xlab("X variable") + 
  ggtitle("Log Transformation of X") +
  theme_minimal()+
  # Here comes the gganimate code
  transition_states(step) +
  enter_fade() 

animate(goo, nframes = 300, fps = 20, end_pause = 4,renderer=gifski_renderer("logtransform.gif"))



