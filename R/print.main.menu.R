
print.main.menu<-function(){
    Ne.pars<-npops+junctions
    anc.Ne.pars<-junctions
    time.Ne.pars<-0
    if(exists("enNe")){
      Ne.pars<-Ne.pars+length(enNe)
      anc.Ne.pars<-anc.Ne.pars+length(enNe)
      time.Ne.pars<-length(ent)
    }
    if(mig.presence=="NO"){
      mig.pars<-0
      anc.mig.pars<-0
      time.mig.pars<-0
    }
    if(mig.presence=="YES"){
      mig.pars<-length(ma)
      anc.mig.pars<-0
      time.mig.pars<-0
      if(exists("ema",envir=.GlobalEnv)){
        anc.mig.pars<-length(ema)
        time.mig.pars<-length(emat)
      }
    }
    
{cat(paste("A > Number of populations to simulate     ",npops),
     paste("B > Tree                                  ",tree),
     paste("    Number of nodes (junctions)           ",junctions),
     paste("C > Migration                             ",mig.presence),
     paste("D > Pop size change through time          ",hist.demog),
     paste("n > Setup Ne priors"),
     paste("    Population size parameters (total)    ",Ne.pars),
     paste("    current Ne parameters                 ",npops),
     paste("    ancestral Ne parameters               ",anc.Ne.pars),
     paste("m > Setup Migration priors"),
     paste("    current migration                     ",mig.pars),
     paste("    ancestral migration parameters        ",anc.mig.pars),
     paste("t > Setup time priors "),
     paste("    time of join parameters               ",junctions),
     paste("    time of Ne change parameters          ",time.Ne.pars),
     paste("    time of Migration change parameters   ",time.mig.pars),
     paste("X > Conditions"),
     paste("Q > Quit, my model is Ready!"),
     sep="\n")
}
}

