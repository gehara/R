
switch.main.menu<-function(){
  .e$YES<-c("Y","y","yes","YES","Yes")
  .e$NO<-c("N","n","No","NO","no")
  
  switch(letter,
         
         A = {remove.all.par()
              join.par()
              cur.Ne.par()
              sys.frame(which=0)
              main.menu()},
         
         B = {join.par()
              cur.Ne.par()
              sys.frame(which=0)
              main.menu()},
         
         C = {.e$mig.presence<-readline("Migration among populations (YES or NO)?: ")
              if(.e$mig.presence %in% .e$YES){
                mig.par()
                mig.menu()} else if (.e$mig.presence %in% NO){
                  options(warn=-1)
                  rm(m,em,envir=.e)
                  options(warn=0)
                }
         sys.frame(which=0)
                main.menu()},
         
         
         D = {hist.demog<-readline("Ne change throgh time (YES or NO?): ")
         if (hist.demog %in% .e$NO){
            options(warn=-1)
            rm(en,envir=.e)
            options(warn=0)
          }else if(hist.demog %in% .e$YES){
            if(exists("en",envir=.e)){
              x<-readline("Do you want to change ancestral Ne paramentes (YES or NO)? ")
              if(x %in% .e$YES){
                anc.Ne.par()
                } else {}
            } else {
              anc.Ne.par()
              }
          }
         sys.frame(which=0)
              main.menu()},
         
         E = {demog.menu()},
         
        "F" = {if(exists("m",envir=.e)){
              }else{
              .e$mig.presence<-readline("Migration among populations (YES or NO)?: " )
              if(.e$mig.presence=="NO"){ main.menu()
                } else {mig.par()}
              }
          sys.frame(which=0)
              mig.menu()},
         
         G = {time.menu()},
         
         H = {condition.matrix()
             condition.menu()},
        
        I = {loci.par()
          sample.pars()
          gene.menu()},
                
         Q={get.model()}
      )}
