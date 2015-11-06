place.time.condition<-function(){
  print(.GlobalEnv$time.matrix)
cond<-readline("Write the name of 2 parameters with a logic sign inbetween ( >  or < or = ) separated by a space.
               Ex: Ne0.pop1 > Ne0.pop2 : ")
cond<-strsplit(cond," ")
y<-grep(cond[[1]][1],rownames(.GlobalEnv$time.matrix))
x<-grep(cond[[1]][3],colnames(.GlobalEnv$time.matrix))
.GlobalEnv$time.matrix[y,x]<-cond[[1]][2]
condition.menu()
}

