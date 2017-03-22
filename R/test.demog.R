test.demog<-function(nsims,Ne.prior,time.prior, gene.prior,observed,alpha=F,tol=0.01){
  tabela<-NULL

  for(i in 1:nrow(Ne.prior)){

    parameters<-NULL
    models<-NULL
    index<-NULL
    mod<-cbind(c(1,0.001,1),c(1,1,10))
    rownames(mod)<-c("CS","Exp","BOTT")

    for(j in 1:nrow(mod)){
      sim.demog(nsims=nsims,coexp.prior=coexp.prior,Ne.prior=Ne.prior[i,], alpha=alpha,
                NeA.prior=mod[j,],time.prior=time.prior[i,],gene.prior=gene.prior[i,],append.sims = F, path="~/Desktop")
      result<-read.table("demog_sim.txt", header=T)
      pars<-read.table("pop_parameters.txt", header=T)
      models<-rbind(models,result)
      parameters<-rbind(parameters,pars)
      index<-c(index,rep(rownames(mod)[j],nrow(result)))
    }
    setwd("~/Desktop")
    prob<-postpr(observed[i,],index,models[,5:8],method="rejection", tol=tol)
    prob<-summary(prob)

    tabela<-rbind(tabela,prob$Prob)
  }
  rownames(tabela)<-Ne.prior[,1]
  return(tabela)
}



