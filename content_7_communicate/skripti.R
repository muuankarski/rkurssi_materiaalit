
  
#' Tämä skripti on löytyy jokaisen kurssin opetuskerran kansiosta.

# Lataa ja tallenna data

d <- read.csv('content_7_communicate/mtcars.csv',
              stringsAsFactors = FALSE)

# Piirrä kuva
library(ggplot2)
p <- ggplot(d, aes(x=hp,y=qsec,color=cyl,size=mpg))
p <- geom_point() + geom_smooth()
p
  
# Tallenna kuva
ggsave(p, file='content_7_communicate/plot.png')


  
