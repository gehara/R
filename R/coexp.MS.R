coexp.MS<-function(MS.par,gene.prior,alpha){
  
  nspecies<-length(MS.par)
  nruns<-nrow(MS.par[[1]])
  sim<-list(NULL)
  
  #for(zz in 1:nspecies){
   # write(paste('ms 10',nruns), file=paste("sims",zz,".txt",sep=""))
  #}
  if(alpha==TRUE){
    for(ii in 1:nruns){
      nspecies<-nspecies
      for(xx in 1:nspecies){
        sims<-ms(gene.prior[xx,6],1,opts=paste("-t",MS.par[[xx]][ii,1],"-G",MS.par[[xx]][ii,4],"-eG",MS.par[[xx]][ii,2],0,"-eN",MS.par[[xx]][ii,2],MS.par[[xx]][ii,3]))
        #write(sims[2:length(sims)], file=paste("sims",xx,".txt",sep=""),append=T)
        sim[[xx]]<-sims 
      }
      # print(ii)
    }
    }
  if(alpha==FALSE){
    for(ii in 1:nruns){
      nspecies<-nspecies
      for(xx in 1:nspecies){
        sims<-ms(gene.prior[xx,6],1,opts=paste("-t",MS.par[[xx]][ii,1],"-eN",MS.par[[xx]][ii,2],MS.par[[xx]][ii,3]))
        #write(sims[2:length(sims)], file=paste("sims",xx,".txt",sep=""),append=T)
        sim[[xx]]<-sims 
      }
    # print(ii)
    }
    }
  return(sim)
}