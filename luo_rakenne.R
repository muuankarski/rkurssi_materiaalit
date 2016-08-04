# Luodaan kurssin materiaalikansion hakemistorakenne

dir.create("./content_1_intro")
dir.create("./content_2_import")
dir.create("./content_3_tidy")
dir.create("./content_4_transform")
dir.create("./content_5_visualise")
dir.create("./content_6_model")
dir.create("./content_7_communicate")

# Tehdään kuhunkin kansioon samansisältöinen skripti

dirs <- list.dirs("./", recursive = FALSE, full.names = FALSE)
dirs <- dirs[!grepl(pattern = "git", dirs)]
dirs <- dirs[!grepl(pattern = ".Rproj", dirs)]

# Luodaan sama skripti ja tallennetaan data kuhunkin kansioon 
for (dir in dirs){
  
  fileConn<-file(paste0(dir,"/skripti.R"))
  writeLines(paste0("
  
#' Tämä skripti on löytyy jokaisen kurssin opetuskerran kansiosta.

# Lataa ja tallenna data

d <- read.csv('",dir,"/mtcars.csv',
              stringsAsFactors = FALSE)

# Piirrä kuva
library(ggplot2)
p <- ggplot(d, aes(x=hp,y=qsec,color=cyl,size=mpg))
p <- geom_point() + geom_smooth()
p
  
# Tallenna kuva
ggsave(p, file='",dir,"/plot.png')


  "), 
  fileConn)
  close(fileConn)
  
  # Lataa ja tallenna csv data kuhunkin kansioon samalla nimellä
  download.file(url = "https://vincentarelbundock.github.io/Rdatasets/csv/datasets/mtcars.csv", 
                destfile = paste0(dir,"/mtcars.csv"))

}