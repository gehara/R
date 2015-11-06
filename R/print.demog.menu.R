print.demog.menu<-function()
  {
  if(ejNe[[1]][3]=="normal")
    dist.par<-"Mean, SD"
  if(ejNe[[1]][3]=="uniform")
    dist.par<-"min, max"
  if(exists("enNe",envir=.GlobalEnv)){
    anc.Ne<-"YES"
  }else{
    anc.Ne<-"NO"
  } 
  
  cat(paste("A > Ne prior distribution:              ",ejNe[[1]][3]),
      paste("N > Different ancestral Ne?             ",anc.Ne),
      paste("P > main Ne priors              c(",dist.par,")"),
      paste("                ",names(n),"     ",n),
      paste(" "),
      paste("     -- ancestral Ne at junctions: "),
      paste("            ",names(ejNe),"     ",ejNe),
      paste("  "),
      if(exists("enNe"))
      paste("p > demog Ne priors             c(",dist.par,")"),
      if(exists("enNe"))
      paste("     -- ancestral Ne before junctions: "),
      if(exists("enNe"))
      paste("                ",names(enNe),"     ",enNe),
      paste("B > Back to Ne menu"),
      sep="\n")
}
