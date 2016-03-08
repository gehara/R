coexp.sample.pars<-function(nruns,
                            var.zeta,
                            coexp.prior,
                            Ne.prior,
                            NeA.prior,
                            time.prior,
                            gene.prior){
  
  MS.par<-list(NULL)
  coexp.par<-matrix(nrow=nruns,ncol=4)
  nspecies<-nrow(Ne.prior)
  
  for(i in 1:nspecies){
    mat<-matrix(nrow=nruns,ncol=3)
    MS.par[[i]]<-mat
  }
  for(j in 1:nruns){
     Ts<-runif(1,coexp.prior[1],coexp.prior[2])
     time.prior.B<-time.prior 
     if (var.zeta=="FREE") {
      zeta.space<-1/nspecies # creates prior for n coexpanding species
      zeta.space<-zeta.space*(1:nspecies) # creates prior for n coexpanding species
      zeta<-sample(zeta.space,1)
      zeta.b<-nspecies*zeta
    } else {
      zeta<-var.zeta
      zeta.b<-nspecies*zeta
    }
    
    coexp.sp<-sort(sample.int(nspecies,zeta.b))
    time.prior.B[c(coexp.sp),c(3,4)]<-Ts
   
    for(u in 1:nrow(time.prior.B)){
    time.prior.B[u,3:4]<-runif(1,time.prior.B[u,3],time.prior.B[u,4])
    }
    
    Et<-mean(time.prior.B[,3])
    Disp.index<-var(time.prior.B[,3])/Et
      
    coexp.par[j,]<-c(zeta,Ts,Et,Disp.index)
    
    for(i in 1:nspecies){
      ms.par<-NULL
      
      Ne <- runif(1, Ne.prior[i,3], Ne.prior[i,4])
      Ne.EXP.t <- time.prior.B[i,3]/time.prior[i,5] #corrects by generations
      theta.A.ratio <- runif(1, NeA.prior[i,3], NeA.prior[i,4])# thetaA (NeA) ratio  
      NeA <- Ne*theta.A.ratio
      mi <- runif(1,gene.prior[i,3],gene.prior[i,4])
      
      theta=4*Ne*mi*gene.prior[i,5]*gene.prior[i,7]
      scalar=4*Ne
      EXP.time=Ne.EXP.t/scalar
      #g.rate=-log(NeA/Ne)/Ne.EXP.t
      
      ms.par<-cbind(theta,EXP.time,theta.A.ratio)
      MS.par[[i]][j,]<-ms.par
      
      
    }
    #print(j)
  }
  #write.table(coexp.par,file="sim.par.txt", quote=F,row.names=F, col.names=F, append=T, sep="\t")
  #return(MS.par)
  pars<-list(NULL,NULL)
  names(pars)<-c("coexp.par","MS.par")
  pars$coexp.par<-coexp.par
  pars$MS.par<-MS.par
  return(pars)
}
