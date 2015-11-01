ttest<-function(){
      
      ttestdf<- data.frame(componente=character(), meanTRUE=double(), 
                           meanFALSE=double(), pt=character(),
                           stringsAsFactors=FALSE)
      
      for(i in 1:length(ordencomp)){
            
            ttestdf[i, 1]<-ordencomp[i]      
            
            if(nrow(filter(df, componente==ordencomp[i])) > 30){
                  
                  tt<-t.test(select(filter(df, UCO==TRUE, componente==ordencomp[i]), valorn), 
                             select(filter(df, UCO==FALSE, componente==ordencomp[i]), valorn), 
                             var.equal=TRUE, alternative="two.sided", conf.level = 0.95)      
                  
                  ttestdf[i, 2]<-as.double(tt$estimate[1])      
                  ttestdf[i,3]<-as.double(tt$estimate[2])
                  ttestdf[i,4]<-ifelse(as.double(tt$p.value) < 0.05, "SI", "NO")
            }
      }
      
      names(ttestdf)<-c("Componente", "IVn > 132", "IVn <= 132", "p (student t test)")
      
      ttestdf
}