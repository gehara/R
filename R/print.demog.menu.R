print.demog.menu<-function()
  {
  if(.e$n[1,6]=="normal")
    dist.par<-"Mean, SD"
  if(.e$n[1,6]=="uniform")
    dist.par<-"min, max"
  
  cat(paste("A > Ne prior distribution:              ",.e$n[1,6]),
      paste("N > Different ancestral Ne?             ",exists("en",envir=.e)),
      paste("P > main Ne priors                  c(",dist.par,")"),
      paste("                ",.e$n[,1],"      ",.e$n[,4],"     ",.e$n[,5]),
      paste(" "),
      if(exists("en",envir=.e))
      paste("     -- ancestral Ne: "),
      if(exists("en",envir=.e))
      paste("                ",.e$en[,1],"      ",.e$n[,4],"    ",.e$n[,5]),
      paste("B > Back to Ne menu"),
      sep="\n")
}
