
print.main.menu<-function(){
    
    
{cat(paste("A > Number of populations to simulate     ",length(.e$n[,1])),
     paste("B > Tree                                  ",.e$tree),
     paste("    Number of nodes (junctions)           ",length(.e$ej[,1])),
     paste("C > Migration                             ",exists("m",envir=.e)),
     paste("D > Pop size change through time          ",exists("en",envir=.e)),
     paste("n > Setup Ne priors"),
     paste("    Population size parameters (total)    ",length(.e$n[,1])+length(.e$en[,1])),
     paste("    current Ne parameters                 ",length(.e$n[,1])),
     paste("    ancestral Ne parameters               ",length(.e$en$size[,1])),
     paste("m > Setup Migration priors"),
     paste("    current migration                     ",length(.e$m[,1])),
     paste("    ancestral migration parameters        ",length(.e$em$size[,1])),
     paste("t > Setup time priors "),
     paste("    time of join parameters               ",length(.e$j[,1])),
     paste("    time of Ne change parameters          ",length(.e$en$time[,1])),
     paste("    time of Migration change parameters   ",length(.e$em$time[,1])),
     paste("X > Conditions"),
     paste("Q > Quit, my model is Ready!"),
     sep="\n")
}
}

