#setwd("/media/marcelo/HD2/Dropbox/Programacao/Rcodes/ABC.package/menu")
#setwd("C:/Users/Guilherme/Dropbox/ABC.package/menu")
library(ape)
.e<-new.env()

main.menu<-function()
  {
  
  if(exists("tree", envir=.e)){
  
    }else{join.par()
      cur.Ne.par()}
  
  print.main.menu()  

    letter<<-readline(">>>>")
  
  switch.main.menu()

  }



