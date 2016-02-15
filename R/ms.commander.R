
ms.commander<-function(model){

size.pars<-rbind(model$flags$n,model$flags$en$size)
mig.pars<-rbind(model$flags$m,model$flags$em$size)
time.pars<-rbind(model$flags$ej,model$flags$en$time,model$flags$em$time)

size.pars<-sample.w.cond(par.matrix=size.pars,cond.matrix=model$conds$size.matrix)
mig.pars<-sample.w.cond(par.matrix=mig.pars,cond.matrix=model$conds$mig.matrix)
time.pars<-sample.w.cond(par.matrix=time.pars,cond.matrix=model$conds$time.matrix)

loci<-sample.pars(model$loci)

if(model$flags$n[1,6]=="runif") {Ne0<-min(as.numeric(model$flags$n[,4]))
} else {Ne0<-mean(as.numeric(model$flags$n[,4]))}



ms.scalar<-4*Ne0

size.pars[,4:5]<-as.numeric(size.pars[,4])/ms.scalar
time.pars[,4:5]<-as.numeric(time.pars[,4])/ms.scalar
mig.pars[,4:5]<-as.numeric(mig.pars[,4])*as.numeric(size.pars[,4])

loci<-cbind(loci,4*Ne0*as.numeric(loci[,4])*as.numeric(loci[,2])*as.numeric(loci[,3]))





l<-NULL
for(i in 1:as.numeric(max(size.pars[,3]))){
l<-c(l,paste0(size.pars[i,c(2:4)],collapse=" "))
}
l<-paste0(l,collapse = " ")

emt<-subset(time.pars, time.pars[,2]=="-em")
em<-subset(mig.pars, mig.pars[,2]=="-em")
m<-NULL
for(i in 1:nrow(em)){
m<-c(m,paste(emt[i,2],emt[i,4],em[i,3],em[i,4],collapse=" "))  
}
m<-paste(m, collapse=" ")

ent<-subset(time.pars, time.pars[,2]=="-en")
en<-subset(size.pars, size.pars[,2]=="-en")
n<-NULL
for(i in 1:nrow(em)){
  n<-c(n,paste(ent[i,2],ent[i,4],en[i,3],en[i,4],collapse=" "))  
}
n<-paste(n, collapse=" ")

ej<-subset(time.pars, time.pars[,2]=="-ej")
j<-NULL
for(i in 1:nrow(ej)){
  j<-c(j,paste(ej[i,2],ej[i,4],ej[i,3],collapse=" "))  
}
j<-paste(j, collapse=" ")



string<-paste(l,m,n,j,collapse=" ")

commands<-list(NULL)
for(i in 1:nrow(loci)){
  y<-paste("-t",loci[i,7],paste(model$I[i,2:ncol(model$I)],collapse=" "),collapse=" ")
commands[[i]]<-paste(y,string, collapse=" ")  
}

return(commands)
}
