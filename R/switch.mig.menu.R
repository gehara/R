
switch.mig.menu<-function(){
  ma<-.GlobalEnv$ma
  if(exists(".GlobalEnv$ema"))
    ema<-.GlobalEnv$ema
  switch(letter,
         A = {prior.dist.mig<-readline("Migration prior distribution (normal or uniform?): ")
              for(i in 1:length(ma)){
                ma[[i]][3]<-prior.dist.mig
              }
              .GlobalEnv$ma<-ma
              if(exists("ema",envir=.GlobalEnv)){
                prior.dist.mig<-prior.dist.mig
                for(i in 1:length(ema)){
                  ema[[i]][3]<-prior.dist.mig
                }
              .GlobalEnv$ema<-ema
              }  
              mig.menu()},
         P = {for(i in 1:length(ma)){
              if(ma[[i]][3]=="normal"){
              ma[[i]][1]<-readline(paste("migration prior (4Nm)",names(ma[i]),"mean: "))
              ma[[i]][2]<-readline(paste("migration prior (4Nm)",names(ma[i]),"Standard Deviation: "))
              }
              if(ma[[i]][3]=="uniform"){
              ma[[i]][1]<-readline(paste("migration prior (4Nm)",names(ma[i]),"min: "))
              ma[[i]][2]<-readline(paste("migration prior (4Nm)",names(ma[i]),"max: "))
              }
              .GlobalEnv$ma<-ma}
              
              if(exists("ema",envir=.GlobalEnv)){
              for(i in 1:length(ema)){
                if(ema[[i]][3]=="normal"){
                  ema[[i]][1]<-readline(paste("migration prior (4Nm)",names(ema[i]),"mean: "))
                  ema[[i]][2]<-readline(paste("migration prior (4Nm)",names(ema[i]),"Standard Deviation: "))
                }
                if(ema[[i]][3]=="uniform"){
                  ema[[i]][1]<-readline(paste("migration prior (4Nm)",names(ema[i]),"min: "))
                  ema[[i]][2]<-readline(paste("migration prior (4Nm)",names(ema[i]),"max: "))
                }
              .GlobalEnv$ema<-ema}
              }
              mig.menu()},
         M = {anc.mig<-readline("Different ancestral migration (YES or NO?): ")
              if(anc.mig=="YES"){
                anc.mig.par()
                mig.menu()
                } else if (exists("ema")){
                rm(ema, envir=.GlobalEnv)
                mig.menu()
              } else {
                mig.menu()
              }},
         
         B = {main.menu()},)
  
}
