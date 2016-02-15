
simulator<-function(model,ksims,path=getwd(),append.sims=F){
  swap<-tempdir()
  
  for(i in 1:nrow(model$I)){
    head<-paste("ms",sum(as.numeric(model$I[i,4:ncol(model$I)])),1000)
    write(head,file=paste(swap,"/locus",i,sep=""))
  }
  
  for(j in 1:ksims){
    for(k in 1:1000){
      for(u in 1:nrow(model$I)){
        sims<-ms(nreps=1,nsam=sum(as.numeric(model$I[u,4:ncol(model$I)])),opts=ms.commander(model)[[u]])
        write(sims[2:length(sims)],file=paste(swap,"/locus",u,sep=""), append=T)
        
      }
      print(k)
    }
  }
  
ss<-list(NULL)

  for(i in 1:nrow(model$I)){
   print("reading simulations")
   ss[[i]]<-readMS(paste(swap,"/locus",i,sep=""), big.data = F)
   print("calculating sumary statistics")
   ss[[i]]<-neutrality.stats(ss[[i]],FAST=T)
   ss[[i]]<-diversity.stats(ss[[i]])
}

}

