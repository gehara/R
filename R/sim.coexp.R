sim.coexp<-function(nsims,
                    var.zeta,
                    coexp.prior,
                    Ne.prior,
                    NeA.prior,
                    time.prior,
                    gene.prior,
                    alpha=F,
                    append.sims=F,
                    path=getwd())
{

  setwd(path)
  
  
  if(append.sims==F){
    simulations<-matrix(nrow=1,ncol=20)
    simulations[1,]<-c("zeta","ts","E(t)","var(t)/E(t)",
               "var.pi","var.nH","var.H","var.TD",
               "mean.pi","mean.nH","mean.H","mean.TD",
               "skew.pi","skew.nH","skew.H","skew.TD",
               "kur.pi","kur.nH","kur.H","kur.TD")
    
    write.table(simulations,file="simulations.txt", quote=F,row.names=F, col.names=F, sep="\t")
    
  }
  
  
  TIME<-system.time(for (i in 1:nsims){
    
    x<-coexp.sample.pars(nruns=1,var.zeta=var.zeta,coexp.prior=coexp.prior,Ne.prior=Ne.prior,
                         NeA.prior=NeA.prior,time.prior=time.prior,gene.prior=gene.prior)
    
    y<-coexp.MS(MS.par=x$MS.par, gene.prior = gene.prior,alpha=alpha)
    
    z<-coexp.sumstat(ms.output=y,gene.prior=gene.prior)
    
    simulations<-c(x$coexp.par,z)
    
    write.table(t(simulations),file="simulations.txt", quote=F,row.names=F, col.names=F, append=T, sep="\t")
    print(paste(i,"sims of",nsims,"| zeta = ",x$coexp.par[,1]))
    #setTxtProgressBar(pb, i)
  })
  #close(pb)
  print(TIME)
}
