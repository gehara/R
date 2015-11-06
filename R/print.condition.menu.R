
print.condition.menu<-function(){
   
{cat(paste("size parameter                         ",colnames(size.matrix)),
     paste("   "),
     paste("time parameter                         ",colnames(time.matrix)),
     paste("   "),
     paste("s > place a size condition"),
     paste("t > place a time condition"),
     paste("M > see size matrix"),
     paste("m > see time matrix"),
     paste(""),
     paste("B > back to main menu"),
     sep="\n")
}
}
