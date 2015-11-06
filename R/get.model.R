

get.model<-function(){
join.matrix<-.GlobalEnv$join.matrix
size<-list(NULL,NULL,NULL,NULL,NULL)
names(size)<-c("n","enNe","ejNe","ma","ema")
size$n<-.GlobalEnv$n
size$enNe <- .GlobalEnv$enNe
size$ejNe <- .GlobalEnv$ejNe
size$ma <- .GlobalEnv$ma
size$ema <- .GlobalEnv$ema

time<-list(NULL,NULL,NULL)
names(time)<-c("ent","emat","ejt")
time$ent<-.GlobalEnv$ent
time$emat<-.GlobalEnv$emat
time$ejt<-.GlobalEnv$ejt

conditions<-list(NULL,NULL)
names(conditions)<-c("size.matrix","time.matrix")
conditions$size.matrix<-.GlobalEnv$size.matrix
conditions$time.matrix<-.GlobalEnv$time.matrix

model<-list(size,time,join.matrix,conditions)
#rm(list=ls(envir=.GlobalEnv),envir=.GlobalEnv)
return(model)
}

