

condition.matrix<-function(){
size<-.e$n
if(exists("enNe", envir=.e)){
size<-c(size,.e$enNe)
}
size<-c(size,.e$ejNe)
size<-c(size,.e$ma)
if(exists("ema", envir=.e)){
size<-c(size,.e$ema)
}
size.matrix<-matrix(nrow=length(size),ncol=length(size))
colnames(size.matrix)<-names(size)
rownames(size.matrix)<-names(size)
diag(size.matrix)<-0


time<-.e$ejt
if(exists("ejt", envir=.e)){
time<-c(time,.e$ent)
}
if(exists("emat",envir=.e)){
time<-c(time,.e$emat)
}
time.matrix<-matrix(nrow=length(time),ncol=length(time))
colnames(time.matrix)<-names(time)
rownames(time.matrix)<-names(time)
diag(time.matrix)<-0

.e$time.matrix<-time.matrix
.e$size.matrix<-size.matrix
}

