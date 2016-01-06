
switch.main.menu<-function(){
  switch(letter,
         
         A = {remove.all.par()
              join.par()
              cur.Ne.par()
              main.menu()},
         
         B = {join.par()
              cur.Ne.par()
              main.menu()},
         
         C = {.e$mig.presence<-readline("Migration among populations (YES or NO)?: ")
              if(.e$mig.presence=="YES"){
                mig.par()
                mig.menu()} else if (.e$mig.presence=="NO"){
                  options(warn=-1)
                  rm(m,em,envir=.e)
                  options(warn=0)
                  } 
                main.menu()},
         
         D = {hist.demog<-readline("Ne change throgh time (YES or NO?):")
              if(hist.demog=="YES"){
              anc.Ne.par()
              demog.menu()} else if (hist.demog=="NO"){
                options(warn=-1)
                rm(en,envir=.e)
                options(warn=0)
              }
              main.menu(),
         
         E = {if(exists("ma",envir=.e)){
              }else{
              .e$mig.presence<-readline("Migration among populations (YES or NO)?: " )
              if(.e$mig.presence=="NO"){ main.menu()
                } else {mig.par()}
              }
              mig.menu()},
         
         "F" = {demog.menu()},
         
         G= {time.menu()},
         
         H= {condition.matrix()
             condition.menu()},
                
         Q={get.model()}
      )}
