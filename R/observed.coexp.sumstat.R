observed.coexp.sumstat<-function(path.to.fasta,fasta.files=list.files()){
  
  ms.output<-fasta2ms(path.to.fasta,fasta.files,write.file=F)
  bp.length<-list()
  for(i in 1:length(ms.output)){
    fas<-read.dna(file=fasta.files[i], format="fasta")
    bp.length[[i]]<-ncol(fas)
  }
  
  sum.stat<-NULL
  for (j in 1:length(ms.output)){
    x<-ms.to.DNAbin(ms.output = ms.output[[j]],bp.length = bp.length[[j]])

    pi<-nuc.div(x)
    H<-H.div(x)
    TD<-tajima.test(x)$D
    
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
names(h.s)<-c("var.pi","var.nH","var.H","var.TD",
              "mean.pi","mean.nH","mean.H","mean.TD",
              "skew.pi","skew.nH","skew.H","skew.TD",
              "kur.pi","kur.nH","kur.H","kur.TD")
#write.table(t(h.s),file="h.sum.stat.txt",col.names = F, row.names=F, append=T,sep="\t")  
return(h.s)
}
