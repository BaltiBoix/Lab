require(dplyr, quietly = TRUE)
require(ggplot2, quietly = TRUE)
require(zoo, quietly = TRUE)
require(grid, quietly = TRUE)
require(gridExtra, quietly = TRUE)

if(!exists("ordencomplist")) source("ordencomplist.R", encoding="UTF-8")
if(!exists("plotgraf")) source("plotgraf.R", encoding="UTF-8")
if(!exists("leedatos")) source("leedatos.R", encoding="UTF-8")
if(!exists("filtraRHC")) source("filtraRHC.R", encoding="UTF-8")
if(!exists("ttest")) source("ttest.R", encoding="UTF-8")

ordencomp<-ordencomplist()

df<-leedatos()

df<-filtraRHC()

ttestdf<- ttest()

plotgraf()
