

get.model<-function(){

model<-list(NULL,NULL,NULL,NULL)
names(model)<-c("loci","I","flags","conds")
model$loci<-.e$loci
model$I<-.e$I

flags<-list(NULL,NULL,NULL,NULL,NULL)
names(flags)<-c("n","m","en","em","ej")
flags$n <- .e$n
flags$m <- .e$m
flags$en <- .e$en
flags$em <- .e$em
flags$ej <- .e$ej

model$flags<-flags

conds<-list(NULL,NULL,NULL)
names(conds)<-c("size.matrix","mig.matrix","time.matrix")
conds$size.matrix<-.e$size.matrix
conds$mig.matrix<-.e$mig.matrix
conds$time.matrix<-.e$time.matrix

model$conds<-conds


model[[1]]<-gsub("uniform","runif",model[[1]])
model[[1]]<-gsub("normal","rtnorm",model[[1]])

for(i in c(1,2,5)){
  model[[3]][[i]]<-gsub("uniform","runif",model[[3]][[i]])
  model[[3]][[i]]<-gsub("normal","rtnorm",model[[3]][[i]])
}
for(i in 3:4){
  for(j in 1:2){
    model[[3]][[i]][[j]]<-gsub("uniform","runif",model[[3]][[i]][[j]])
    model[[3]][[i]][[j]]<-gsub("normal","rtnorm",model[[3]][[i]][[j]])
  }
}

rm(list=ls(envir=.e),envir=.e)
return(model)
}

