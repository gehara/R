print.time.menu<-function()
  {
  if(ejt[[1]][3]=="normal")
    dist.par<-"Mean, SD"
  if(ejt[[1]][3]=="uniform")
    dist.par<-"min, max"
    
  cat(paste("A > Time prior distribution:    ",ejt[[1]][3]),
      paste("    Time priors                  c(",dist.par,")"),
      paste("   j >  time of junctions: "),
      paste("                    ",names(ejt),"     ",ejt),
      paste(" "),
      if(exists("ent"))
      paste("   n >  time of ancestral Ne change: "),
      if(exists("ent"))
      paste("            ",names(ent),"     ",ent),
      paste("  "),
      if(exists("emat"))
      paste("   m >  time of migration change: "),
      if(exists("emat"))
      paste("                ",names(emat),"     ",emat),
      paste("B > Back to Ne menu"),
      sep="\n")
}
