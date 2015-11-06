
switch.main.menu<-function(){
  switch(letter,
         
         A = {.GlobalEnv$npops<-as.numeric(readline("Number of populations to simulate: "))
              if(exists("ma", envir=.GlobalEnv))
                rm(ma, envir=.GlobalEnv)
              if(exists("emat",envir=.GlobalEnv))
                rm(emat, envir=.GlobalEnv)
              if(exists("enNe",envir=.GlobalEnv))
                rm(enNe,envir=.GlobalEnv)
              if(exists("ent",envir=.GlobalEnv))
                rm(ent,envir=.GlobalEnv)
              if(exists("ejNe",envir=.GlobalEnv))
                rm(ejNe,envir=.GlobalEnv)
              mig.presence<<-"NO"
              hist.demog<<-"NO"
              list.of.par()
              join.par()
              main.menu()},
         
         B = {join.par()
              #junctions.menu()
              main.menu()},
         
         C = {.GlobalEnv$mig.presence<-readline("Migration among populations (YES or NO)?: ")
              if(.GlobalEnv$mig.presence=="YES"){
                mig.par()
                mig.menu()} else if (.GlobalEnv$mig.presence=="NO"){
                  if (exists("ema",envir=.GlobalEnv))
                    rm(ema,envir=.GlobalEnv)
                  if (exists("emat",envir=.GlobalEnv))
                    rm(emat, envir=.GlobalEnv)
                  if (exists("ma",envir=.GlobalEnv))
                    rm(ma, envir=.GlobalEnv)
                } 
                main.menu()},
         
         D = {hist.demog<-readline("Ne change throgh time (YES or NO?):")
              hist.demog<<-hist.demog
              anc.Ne.par()
              demog.menu()},
         
         m = {if(exists("ma",envir=.GlobalEnv)){
              }else{
              .GlobalEnv$mig.presence<-readline("Migration among populations (YES or NO)?: " )
              if(.GlobalEnv$mig.presence=="NO"){ main.menu()
                } else {mig.par()}
              }
              mig.menu()},
         
         n = {demog.menu()},
         
         t= {time.menu()},
         
         X= {condition.matrix()
             condition.menu()},
                
         Q={get.model()}
      )}
