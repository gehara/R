setwd("/media/marcelo/HD2/Dropbox/Programacao/Rcodes/ABC.package/menu")
#setwd("C:/Users/Guilherme/Dropbox/ABC.package/menu")
library(ape)

main.menu<-function()
  {
  if(exists("mig.presence")){
  } else { mig.presence<<-"NO"}
  if(exists("hist.demog")){
  } else {hist.demog<<-"NO"}
  if (exists("npops")){
  } else {
    npops<<-2
    list.of.par()
    join.par()
  }
  
  print.main.menu()  
  letter<<-readline(">>>>")
  
  switch.main.menu()
}



