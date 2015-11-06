place.size.condition<-function(){
  print(.GlobalEnv$size.matrix)
cond<-readline("Write the name of 2 parameters with a logic sign inbetween ( >  or < or = ) separated by a space.
               Ex.: Ne0.pop1 < Ne0.pop2")
cond<-strsplit(cond," ")
y<-grep(cond[[1]][1],rownames(.GlobalEnv$size.matrix))
x<-grep(cond[[1]][3],colnames(.GlobalEnv$size.matrix))
.GlobalEnv$size.matrix[y,x]<-cond[[1]][2]
condition.menu()
}
