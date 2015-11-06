

condition.matrix<-function(){
size<-.GlobalEnv$n
if(exists("enNe", envir=.GlobalEnv)){
size<-c(size,.GlobalEnv$enNe)
}
size<-c(size,.GlobalEnv$ejNe)
size<-c(size,.GlobalEnv$ma)
if(exists("ema", envir=.GlobalEnv)){
size<-c(size,.GlobalEnv$ema)
}
size.matrix<-matrix(nrow=length(size),ncol=length(size))
colnames(size.matrix)<-names(size)
rownames(size.matrix)<-names(size)
diag(size.matrix)<-0


time<-.GlobalEnv$ejt
if(exists("ejt", envir=.GlobalEnv)){
time<-c(time,.GlobalEnv$ent)
}
if(exists("emat",envir=.GlobalEnv)){
time<-c(time,.GlobalEnv$emat)
}
time.matrix<-matrix(nrow=length(time),ncol=length(time))
colnames(time.matrix)<-names(time)
rownames(time.matrix)<-names(time)
diag(time.matrix)<-0

.GlobalEnv$time.matrix<-time.matrix
.GlobalEnv$size.matrix<-size.matrix
}

