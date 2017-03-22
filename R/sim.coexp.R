sim.coexp<-function(nsims,
                    var.zeta,
                    coexp.prior,
                    buffer,
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
    simulations<-matrix(nrow=1,ncol=32)
    simulations[1,]<-c("zeta","ts","E(t)","DI",
                       "mean.pi","mean.ss","mean.Num.h","mean.H","mean.TD","mean.TD.p","mean.R2",
                       "var.pi","var.ss","var.Num.h","var.H","var.TD","var.TD.p","var.R2",
                       "skew.pi","skew.ss","skew.Num.h","skew.H","skew.TD","skew.TD.p","skew.R2",
                       "kur.pi","kur.ss","kur.Num.h","kur.H","kur.TD","kur.TD.p","kur.R2")

    write.table(simulations,file="simulations.txt", quote=F,row.names=F, col.names=F, sep="\t")

    populations.par<-matrix(nrow=1,ncol=nrow(NeA.prior)*4)
    pop.names<-NULL
    for(i in 1:nrow(NeA.prior)){
    pop.names<-cbind(pop.names,t(c(paste("Ne",i,sep=""),paste("Exp.time",i,sep=""),paste("NeA",i,sep=""),paste("mi",i,sep=""))))
    }
    populations.par[1,]<-pop.names
    write.table(populations.par,file="pop_parameters.txt", quote=F,row.names=F, col.names=F, sep="\t")
  }


  TIME<-system.time(for (i in 1:nsims){

    x<-coexp.sample.pars(nruns=1,var.zeta=var.zeta,coexp.prior=coexp.prior,buffer=buffer,Ne.prior=Ne.prior,
                         NeA.prior=NeA.prior,time.prior=time.prior,gene.prior=gene.prior)

    y<-coexp.MS(MS.par=x$MS.par, gene.prior = gene.prior,alpha=alpha)

    z<-coexp.sumstat(ms.output=y,gene.prior=gene.prior)

    simulations<-c(x$coexp.par,z)

    populations.par<-unlist(x$pop.par)

    write.table(t(simulations),file="simulations.txt", quote=F,row.names=F, col.names=F, append=T, sep="\t")
    write.table(t(populations.par),file="pop_parameters.txt", quote=F,row.names=F, col.names=F, append=T,sep="\t")
    print(paste(i,"sims of",nsims,"| zeta = ",x$coexp.par[,1]))
   })
  print(TIME)
}
