
loci.par<-function(){
  loci.table<-
  nloci<-3
  loci<-NULL
  for(i in 1:nloci){
    locus<-paste("loci",i,sep="")
    loci<-rbind(loci,locus)
        }
  loci<-data.frame(loci)
  loci[,2]<-NA
  
   for(i in 1:length(model[[1]][[1]])){
     pop<-paste("pop",i,sep="")
     loci[,1]<-rbind(loci,locus)
   }


    
  
  for(i in 1:length(gene.settings$ngenes)){
    for (j in 1:length(length(model[[1]][[1]]))){
    loci.samp[[i]][2][j]<-10
  }
  }
  .GlobalEnv$ma<-migration
  
  "if(anc.mig==YES){
    anc.mig.par()
  }"
  
}
