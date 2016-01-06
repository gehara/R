

get.model<-function(){
join.matrix<-.e$join.matrix
size<-list(NULL,NULL,NULL,NULL,NULL)
names(size)<-c("n","enNe","ejNe","ma","ema")
size$n<-.e$n
size$enNe <- .e$enNe
size$ejNe <- .e$ejNe
size$ma <- .e$ma
size$ema <- .e$ema

time<-list(NULL,NULL,NULL)
names(time)<-c("ent","emat","ejt")
time$ent<-.e$ent
time$emat<-.e$emat
time$ejt<-.e$ejt

conditions<-list(NULL,NULL)
names(conditions)<-c("size.matrix","time.matrix")
conditions$size.matrix<-.e$size.matrix
conditions$time.matrix<-.e$time.matrix

model<-list(size,time,join.matrix,conditions)
#rm(list=ls(envir=.e),envir=.e)
return(model)
}

