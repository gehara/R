list.of.par<-function(){
 
curr.Ne.par<-NULL
  for (i in 1:npops){
    Ne0.par<-paste("Ne0.pop",i,sep="")
    curr.Ne.par<-c(curr.Ne.par,Ne0.par)
  }
  n.Ne.par<-as.numeric(length(curr.Ne.par))
  pop.sizes<-vector(mode="list", length=n.Ne.par)
  names(pop.sizes)<-curr.Ne.par
  
  for(i in 1:length(pop.sizes)){
    pop.sizes[[i]]<-vector(mode="numeric", length=3)
    pop.sizes[[i]][1]<-10000
    pop.sizes[[i]][2]<-100000
    pop.sizes[[i]][3]<-"uniform"
  }
    
  n<<-pop.sizes
  
  junctions<<-npops-1
      
}

