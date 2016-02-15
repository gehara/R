sample.w.cond<-function(par.matrix,cond.matrix){
  
  nam<-rownames(cond.matrix)
  x<-sample.pars(par.matrix)
  
  y<-which(cond.matrix=="<", arr.ind=T)
  
  if(nrow(y)>=1){
    for(i in 1:nrow(y)){
      maior<-NULL
      for(j in 1:2){
        m<-which(par.matrix==nam[y[i,j]])
        maior<-c(maior,m)
      }
      while(x[maior[1],4]>x[maior[2],4]){
        x[c(maior[1],maior[2]),]<-sample.pars(par.matrix[c(maior[1],maior[2]),])
      }
    }
  }
  
  z<-which(cond.matrix=="=", arr.ind=T)
  if(nrow(z)>=1){
    for(i in 1:nrow(y)){
      equal<-NULL
      for(j in 1:2){
        eq<-which(par.matrix==nam[y[i,j]])
        equal<-c(maior,eq)
      }
      equal<-sample(equal,length(equal))
      x[equal[1],4]<-x[equal[2],4]
    }
  }
  return(x)
}
