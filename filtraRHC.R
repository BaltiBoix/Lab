filtraRHC<-function(){
      
      df1<-filter(df, componente=="I. VISCOSIDAD NOR 4.3 CST A 100§C")
      df1<-mutate(df1, UCO=ifelse(valorn>132, TRUE, FALSE))
      df1<-select(df1, fecha, UCO)
      
      df<-merge(df, df1)
      
      subq<-group_by(df, componente)
      dfq<-summarize(subq, q1 = quantile(valorn, 0.05, na.rm = TRUE), q2 = quantile(valorn, 0.95, na.rm = TRUE) ) 
      
      for(i in 1:nrow(dfq)){
            
            df1<-mutate(filter(df, componente==dfq$componente[i]), 
                        inbound=ifelse(valorn>=dfq[i,]$q1 & valorn<=dfq[i,]$q2, TRUE, FALSE))
            if(i==1){
                  df2<-df1
            }else{
                  df2<-rbind(df2,df1)
            }
      }
      
      df2

}