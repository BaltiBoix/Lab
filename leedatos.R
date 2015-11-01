leedatos<-function(){
      
      df<-read.table("TestSGLDatos1.csv", sep = ";")
      df<-df[3:nrow(df),]
      
      names(df)<-c("fecha", "componente", "valor", "uom")
      
      df<-filter(df, valor != "")
      
      df$componente<-factor(df$componente, levels = ordencomp)
      
      mutate(df, valorn=as.numeric(as.character(valor)),
           fecha=as.POSIXct(fecha, format = "%d/%m/%Y %H:%M:%S"),
           trim=as.character(as.yearqtr(fecha))) 
      
}