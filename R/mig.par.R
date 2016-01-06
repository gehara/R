
mig.par<-function(){
  mig.par<-NULL
  for(i in 1:npops){
    for(j in 1:npops){
      if(i==j){}
      else{
        m0<-paste("mig0.",i,"_",j,sep="")
        mig.par<-c(mig.par,m0)
        }
      } 
    }
  n.mig.par<-as.numeric(length(mig.par))
  migration<-vector(mode="list", length=n.mig.par)
  names(migration)<-mig.par


  for(i in 1:length(migration)){
    migration[[i]][1]<-1
    migration[[i]][2]<-10
    migration[[i]][3]<-"uniform"
  }
  .e$ma<-migration
  
  "if(anc.mig==YES){
    anc.mig.par()
  }"
  
}
