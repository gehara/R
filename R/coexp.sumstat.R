coexp.sumstat<-function(ms.output,gene.prior){
sum.stat<-NULL

  for (j in 1:length(ms.output)){
    if(ms.output[[j]][3]=="segsites: 0"){
      pi<-0
      H<-c(0,0)
      TD<-0
    }else{
    x<-ms.output[[j]][5:length(ms.output[[j]])]

    x<-gsub("0","A",x)
    x<-gsub("1","C",x)

    se<-list(NULL,NULL,NULL,NULL)
    names(se)<-c("nb","seq","nam","com")
    se$nb<-length(x)
    se$seq<-x
    se$nam<-c(1:length(x))
    se$com<-NA
    class(se)<-"alignment"
    x<-as.DNAbin(se)

    pi<-nuc.div(x)/gene.prior[j,5]
    TD<-tajima.test(x)$D
     H<-H.div(x)

    }
    ss<-c(pi[[1]],H,TD[1])
    sum.stat<-rbind(sum.stat,ss)
    }
    
vari<-diag(var(sum.stat))
means<-colMeans(sum.stat)
skew<-NULL
kur<-NULL
for(u in 1:4){
  s<-skewness(sum.stat[,u])
  skew<-c(skew,s)
  k<-kurtosis(sum.stat[,u])
  kur<-c(kur,k)
}

h.s<-c(vari,means,skew,kur)
#write.table(t(h.s),file="h.sum.stat.txt",col.names = F, row.names=F, append=T,sep="\t")  
return(h.s)
#return(sum.stat)
}
