####

anc.mig.par<-function(){
  mig.par<-NULL
  for(i in 1:npops){
    for(j in 1:npops){
      if(i==j){
       }else{ x<-readline(paste("How many changes in migration for mig",i,"_",j,": ",sep=""))
        if(x==0){
          }else{
           for(l in 1:x){
              m<-paste("mig",l,".",i,"_",j,sep="")
              mig.par<-c(mig.par,m)
        }
       }
      }
     }
    }
  
  n.mig.par<-as.numeric(length(mig.par))
  migration<-vector(mode="list", length=n.mig.par)
  names(migration)<-mig.par
  
  t.mig.par<-mig.par
  for(i in 1:length(mig.par)){
    t.mig.par[i]<-paste("t.",mig.par[1],sep="")
  }
  
  t.migration<-migration
  names(t.migration)<-t.mig.par
  for(i in 1:length(t.migration)){
    t.migration[[i]][1]<-0
    t.migration[[i]][2]<-0
    t.migration[[i]][3]<-"uniform"
  }
  
  for(i in 1:length(migration)){
    migration[[i]][1]<-0
    migration[[i]][2]<-0
    migration[[i]][3]<-"uniform"
  }
  
  .GlobalEnv$ema<-migration
  .GlobalEnv$emat<-t.migration
}
  