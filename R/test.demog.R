test.demog<-function(nsims,
                     Ne.prior,
                     time.prior,
                     gene.prior,
                     observed,
                     alpha=F,
                     tol=0.01,
                     nval=100,
                     method="rejection",
                     path=path){
  tabela<-NULL
  theme_set(theme_grey(base_size = 30))

  for(i in 1:nrow(Ne.prior)){

    parameters<-NULL
    models<-NULL
    index<-NULL
    mod<-cbind(c(1,0.001,2),c(1,0.1,10))
    rownames(mod)<-c("CS","Exp","BOTT")

    for(j in 1:nrow(mod)){
      sim.demog(nsims=nsims,coexp.prior=coexp.prior,Ne.prior=Ne.prior[i,], alpha=alpha,
                NeA.prior=mod[j,],time.prior=time.prior[i,],gene.prior=gene.prior[i,],append.sims = F, path=path)
      result<-read.table("demog_sim.txt", header=T)
      pars<-read.table("pop_parameters.txt", header=T)
      models<-rbind(models,result)
      parameters<-rbind(parameters,pars)
      index<-c(index,rep(rownames(mod)[j],nrow(result)))
    }
    prob<-postpr(observed[i,],index,models[,5:8],method=method, tol=tol)
    prob<-summary(prob)
    tabela<-rbind(tabela,prob$Prob)
    #if(sort(prob$Prob)[1]==0){
    #  tabela<-rbind(tabela,prob$Prob)
    #} else {
    #  prob<-postpr(observed[i,],index,models[,5:8],method="neuralnet", tol=tol)
    #  prob<-summary(prob)
    #  tabela<-rbind(tabela,prob$neuralnet$Prob)
    #
    #}

    cv<-cv4postpr(index,models[,5:8],nval=nval,tols=tol,method=method)
    pdf(paste("CV_",rownames(observed)[i],".pdf",sep=""), paper="a4r", width=10, pointsize=10)
    plot(cv)
    graphics.off()

    data<-c(index,"observed")
    x<-rbind(models[,5:8],observed[i,])
    PCA<-prcomp(x, center = T, scale. = T, retx=T)
    scores <- data.frame(PCA$x[,1:2])

    PCA.plot<-ggplot(scores, aes(x=PC1, y=PC2))+
      theme(legend.text = element_text(size = 30, face = "bold"))+
      geom_point(aes(colour=data, size=data, shape=data))+
      scale_size_manual(values=c(3,3,3,10))+
      scale_colour_brewer(palette="Spectral")
    pdf(paste("PCA12",rownames(observed)[i],".pdf",sep=""), paper="a4r", width=10, pointsize=10)
    plot(PCA.plot)
    graphics.off()

  }
  rownames(tabela)<-rownames(observed)

  return(tabela)
}



