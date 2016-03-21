
sim.snp.sumstat<-function(model,nsim.blocks,path=getwd(),append.sims=F,block.size=100, msABC.call="./msABC"){
  
  # set working directory
  setwd(path)
  
  if(append.sims==F){
  com<-ms.commander.snp(model,msABC=msABC.call)
  system(paste(com[[1]],"> out.txt"))
  S1<-read.table("out.txt",header = T)
  nam<-t(colnames(S1))
  write.table(nam,file="sumstat.txt",quote=F,row.names = F,col.names = F, append=F,sep="\t")
  write.table(com[[3]][1,],file="parameters.txt",quote=F,row.names = F,col.names = F, append=F,sep="\t")
  }
  
  for(j in 1:nsim.blocks){
  SS<-NULL
  param<-NULL
  for(i in 1:block.size){
    com<-ms.commander.snp(model,msABC=msABC.call)
    
    system(paste(com[[1]],"> out.txt"))
    S1<-read.table("out.txt",header = T)
    
    system(paste(com[[2]],"> out.txt"))
    S2<-read.table("out.txt",header = T)
    sumstat<-rbind(S1,S2)
    sumstat<-colMeans(sumstat,na.rm = T)
    param<-rbind(param,com[[3]][2,])
    SS<-rbind(SS,sumstat)
    print(paste(j,i))}
  
  }
  write.table(SS,file="sumstat.txt",quote=F,row.names = F,col.names = F, append=T)
  write.table(param,file="parameters.txt",quote=F,row.names = F,col.names = F, append=T,sep="\t")
  }
