
sim.sumstat<-function(model,nsim.blocks,path=getwd(),append.sims=F,sim.block.size=1000){
  
  # get population structure
  pops<-get.pops(model)
  # get sumstats names
  NAMES<-get.ss.pop.name(pops[[1]])
  # get temp dir to save ms output
  swap<-tempdir()
  # set working directory
  setwd(path)
  # write output headings
  if(append.sims==F){
  write.table(t(NAMES),file="SumStat.txt",quote=F,row.names=F, col.names = F,sep="\t",append=F)
  write.table(t(ms.commander(model)[[nrow(model$loci)+1]][1,]),file="SampPars.txt",quote=F,row.names=F, col.names = F,sep="\t",append=F)
  }
  # beggin simulations
  thou<-0
  for(j in 1:nsim.blocks){
    # generate ms output vector
    sims<-list(NULL)  
    for(i in 1:nrow(model$I)){
      sims[[i]]<-paste("ms",sum(as.numeric(model$I[i,4:ncol(model$I)])),sim.block.size)
    }
    sims[[nrow(model$loci)+1]]<-vector()
    # ms simulation
    for(k in 1:sim.block.size){
      com<-ms.commander(model)
      for(u in 1:nrow(model$I)){
        S<-ms(nreps=1,nsam=sum(as.numeric(model$I[u,4:ncol(model$I)])),opts=com[[u]])
        sims[[u]]<-c(sims[[u]],S[2:length(S)])
      }
      sims[[nrow(model$loci)+1]]<-rbind(sims[[nrow(model$loci)+1]],com[[nrow(model$loci)+1]][2,])
      print(k+thou)
    }
    # write ms output to file
    for(u in 1:nrow(model$I)){
    write(sims[[u]],file=paste(swap,"/locus",u,sep=""), append=F)
    }
    # Start Summary stats calulation
    print("PopGenome!")
  
    ss<-list(NULL)
    for(u in 1:nrow(model$I)){
      print(paste("reading simulations - locus",u))
      ss[[u]]<-readMS(paste(swap,"/locus",u,sep=""), big.data = F)
      ss[[u]]<-set.populations(ss[[u]],pops[[u]])
      print(paste("calculating sumary statistics - locus",u))
      ss[[u]]<-neutrality.stats(ss[[u]],FAST=T)
      #ss[[u]]<-diversity.stats(ss[[u]])
      #ss[[u]]<-F_ST.stats.2(ss[[u]],snn=F,Phi_ST=T)
      ss[[u]]<-F_ST.stats(ss[[u]],FAST=T)
     
      #ss[[u]]@nuc.diversity.between/as.numeric(model$loci[u,2])
      #ss[[u]]@hap.diversity.between
      s.sites<-ss[[u]]@n.segregating.sites
      pi.within<-ss[[u]]@nuc.diversity.within/as.numeric(model$loci[u,2])
      Hap.div<-ss[[u]]@hap.diversity.within
      ss[[u]]@Tajima.D[is.na(ss[[u]]@Tajima.D)]<-0
      ss[[u]]@Fu.Li.D[is.na(ss[[u]]@Fu.Li.D)]<-0
      ss[[u]]@Fu.Li.F[is.na(ss[[u]]@Fu.Li.F)]<-0
      Taj.D<-ss[[u]]@Tajima.D
      Fu.Li.D<-ss[[u]]@Fu.Li.D
      Fu.Li.F<-ss[[u]]@Fu.Li.F
      Hap.Fst<-ss[[u]]@haplotype.F_ST
      nuc.Fst<-ss[[u]]@nucleotide.F_ST
      ss[[u]]<-cbind(s.sites,pi.within,Hap.div,Taj.D,Fu.Li.D,Fu.Li.F,Hap.Fst,nuc.Fst)
     }
    # mean sumstats
    
    ss<-Reduce("+",ss)/nrow(model$I)
    # write outputs
    write.table(ss,file="SumStat.txt",quote=F,row.names=F, col.names = F, append=T,sep="\t")
    write.table(sims[[nrow(model$loci)+1]],file="SampPars.txt",quote=F,row.names=F, col.names = F,sep="\t",append=T)
    # report job
    print(paste(j,"000 sims done!"))
    thou<-thou+sim.block.size
  }
}
   

