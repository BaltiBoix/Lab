plotgraf<-function(){

#
#     Crea e imprime los gráficos de los componentes en clist
#           1. Datos brutos con la fecha en abcisas
#           2. Boxplot de los componentes que cumplen/no cumplen IVn>132
#           3. Boxplot por trimestres
      
      
      clist<-c("DENSIDAD 15§C",
               "AZUFRE", 
               "NITROGENO", 
               "COLOR ASTM",                       
               "5% RECOGIDO", 
               "10% RECOGIDO", 
               "20% RECOGIDO", 
               "30% RECOGIDO",                     
               "40% RECOGIDO", 
               "50% RECOGIDO", 
               "60% RECOGIDO",                     
               "70% RECOGIDO",  
               "80% RECOGIDO", 
               "90% RECOGIDO", 
               "95% RECOGIDO",                     
               "INDICE VISCOSIDAD", 
               "I. VISCOSIDAD NOR 4.3 CST A 100§C", 
               "VISCOSIDAD A 100§C", 
               "VISCOSIDAD A 65§C")
      
      pdf(file="RHC.pdf")
      
      p<-ggplot(filter(df, componente %in% clist, inbound==TRUE), aes(x=fecha, y=valorn, colour=UCO))
      p<-p + geom_point(size=1)
      p<-p + facet_wrap(~ componente, scales = "free_y", ncol = 3)
      p<-p + ggtitle("Resultados según IVn del RHC\n")
      p<-p + scale_color_discrete(name="UCO",
                                  breaks=c(TRUE, FALSE),
                                  labels=c("IVn > 132", "IVN <= 132"))
      p<-p + theme(axis.title.x = element_blank(),
                   axis.title.y = element_blank(),
                   plot.title = element_text(size=18),
                   axis.text.y = element_text(size=8),
                   axis.text.x = element_text(size=6, angle=90),
                   strip.text.x = element_text(size=6),
                   strip.background = element_rect(colour = "black", size=0.25),
                   panel.border = element_rect(fill=NA, colour = "black", size=0.5),
                   legend.title=element_text(size=8),
                   legend.text = element_text(size=10),
                   legend.position="bottom")
      print(p)
      
      p<-ggplot(filter(df, componente %in% clist, inbound==TRUE), aes(x=UCO, y=valorn))
      p<-p + geom_boxplot(aes(fill=UCO), outlier.size=1, lwd=0.25, fatten=1.5)
      p<-p + facet_wrap(~ componente, scales = "free_y", ncol = 3)
      p<-p + ggtitle("Cuartiles de los resultados según IVn del RHC\n")
      p<-p + scale_fill_discrete(name="UCO",
                                 breaks=c(TRUE, FALSE),
                                 labels=c("IVn > 132", "IVN <= 132"))
      p<-p + theme(axis.title.x = element_blank(),
                   axis.title.y = element_blank(),
                   plot.title = element_text(size=18),
                   axis.text.y = element_text(size=8),
                   axis.text.x = element_text(size=6),
                   strip.text.x = element_text(size=6),
                   strip.background = element_rect(colour = "black", size=0.25),
                   panel.border = element_rect(fill=NA, colour = "black", size=0.5),
                   legend.title=element_text(size=8),
                   legend.text = element_text(size=10),
                   legend.position="bottom")
      print(p)
      
      tth <- ttheme_minimal(
            core=list(bg_params = list(fill = blues9[1:4], col=NA),
                      fg_params=list(fontface=3, cex=0.5)),
            colhead=list(fg_params=list(col="navyblue", fontface=4L, cex=1)),
            rowhead=list(fg_params=list(col="orange", fontface=3L, cex=1)))
      
      grid.newpage()
      
      grid.table(format(ttestdf, digits=4, row.names=FALSE), rows=NULL, theme=tth)
      
      p<-ggplot(filter(df, componente %in% clist, inbound==TRUE, UCO==TRUE), aes(x=trim, y=valorn))
      p<-p + geom_boxplot(aes(fill=trim), outlier.size=1, lwd=0.25, fatten=1.5)
      p<-p + facet_wrap(~ componente, scales = "free_y", ncol = 3)
      p<-p + ggtitle("Resultados por trimestre para IVn del RHC > 132\n")
      p<-p + theme(axis.title.x = element_blank(),
                   axis.title.y = element_blank(),
                   plot.title = element_text(size=18),
                   axis.text.y = element_text(size=8),
                   axis.text.x = element_text(size=6, angle=90),
                   strip.text.x = element_text(size=6),
                   strip.background = element_rect(colour = "black", size=0.25),
                   panel.border = element_rect(fill=NA, colour = "black", size=0.5),
                   legend.title=element_text(size=8),
                   legend.text = element_text(size=10),
                   legend.position="bottom")
      
      print(p)
      
      dev.off()
}