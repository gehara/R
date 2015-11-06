print.mig.menu<-function()
  {
  
  if(ma[[1]][3]=="normal")
    dist.par<-"Mean, SD"
  if(ma[[1]][3]=="uniform")
    dist.par<-"min, max"
  if(exists("ema")){
    anc.mig<-"YES"
  }else{
    anc.mig<-"NO"
  }
  
  cat(paste("A > Migration prior distribution:       ",ma[[1]][3]),
      paste("M > Different ancestral migration?         ",anc.mig),
      paste("P > priors                          c(",dist.par,")"),
      paste("                    ",names(ma),"     ",ma),
      paste(" "),
      if(exists("ema"))
        paste("  ancestral migrations   ",names(ema),"    ",ema),
      paste("B > Back to main menu"),
      sep="\n")
}
