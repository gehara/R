
anc.Ne.par<-function(){
  
  if(hist.demog=="NO"){
    
      if(exists("enNe", envir=.e)){
        rm(enNe, envir=.e)
        rm(ent, envir=.e)
        
      } else {} 
  }
    
  if (hist.demog=="YES"){
    
    if(exists("enNe", envir=.e)){
    } else {
      time.anc.Ne.par<-NULL 
      anc.Ne.par<-NULL
        for (i in 1:npops){
        n.anc.pop<-readline(paste("How many changes in Ne for pop",i,"?",sep=""))
            if (n.anc.pop<1){
            } else (
                for (j in 1:n.anc.pop){
                Ne.par<-paste("Ne",j,".pop",i,sep="")
                anc.Ne.par<-c(anc.Ne.par,Ne.par)
                time.Ne.par<-paste("time.Ne",j,".pop",i,sep="")
                time.anc.Ne.par<-c(time.anc.Ne.par,time.Ne.par)
                }
              )
        }
    n.Ne.par<-as.numeric(length(anc.Ne.par))
    pop.sizes<-vector(mode="list", length=n.Ne.par)
    names(pop.sizes)<-anc.Ne.par
    time.pop.sizes<-vector(mode="list", length=n.Ne.par)
    names(time.pop.sizes)<-time.anc.Ne.par
    
        for(i in 1:length(pop.sizes)){
        pop.sizes[[i]][1]<-10000
        pop.sizes[[i]][2]<-100000
        pop.sizes[[i]][3]<-"uniform"
        time.pop.sizes[[i]][1]<-10000
        time.pop.sizes[[i]][2]<-100000
        time.pop.sizes[[i]][3]<-"uniform"
        }
    enNe<<-pop.sizes
    ent<<-time.pop.sizes
            
    }
  } else {
    hist.demog<<-"NO"
    if(exists("en", envir=.e)){
      rm(en, envir=.e)}
    main.menu()
  }
}
