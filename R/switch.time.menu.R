
switch.time.menu<-function(){
  emat<-.GlobalEnv$emat
  ejt<-.GlobalEnv$ejt
  ent<-.GlobalEnv$ent
  switch(letter,
         A = {prior.dist.Ne<-readline("time prior distribution (normal or uniform): ")
              
              for(i in 1:length(ejt)){
                ejt[[i]][3]<-prior.dist.Ne
              }
              
              if(exists("emat",envir=.GlobalEnv)){
              for(i in 1:length(emat)){
                emat[[i]][3]<-prior.dist.Ne
              }
              .GlobalEnv$emat<-emat
              }
              
              if(exists("ent", envir=.GlobalEnv)){
              for(i in 1:length(ent)){
                ent[[i]][3]<-prior.dist.Ne
              }
              .GlobalEnv$ent<-ent
              }
              .GlobalEnv$ejt<-ejt
                          
              time.menu()},
         
         j = {for(i in 1:length(ejt)){
           if(ejt[[i]][3]=="normal"){
             ejt[[i]][1]<-readline(paste("Time of junction in generations",names(ejt[i]),"mean: "))
             ejt[[i]][2]<-readline(paste("Time of junction in generations",names(ejt[i]),"Standard Deviation: "))
           }
           if(ejt[[i]][3]=="uniform"){
             ejt[[i]][1]<-readline(paste("Time of junction in generations",names(ejt[i]),"min: "))
             ejt[[i]][2]<-readline(paste("Time of junction in generations",names(ejt[i]),"max: "))
           }
           .GlobalEnv$ejt<-ejt
           }
           time.menu()},
           
          n = {for(i in 1:length(ent)){
            if(ent[[i]][3]=="normal"){
              ent[[i]][1]<-readline(paste("Time of Ne change in generations",names(ent[i]),"mean: "))
              ent[[i]][2]<-readline(paste("Time of Ne change in generations",names(ent[i]),"Standard Deviation: "))
              }
            if(ent[[i]][3]=="uniform"){
             ent[[i]][1]<-readline(paste("Time of Ne change in generations",names(ent[i]),"min: "))
             ent[[i]][2]<-readline(paste("Time of Ne change in generations",names(ent[i]),"max: "))
              }
            .GlobalEnv$ent<-ent
            }
           time.menu()
           },
           
           
         m = {for(i in 1:length(emat)){
                if(emat[[i]][3]=="normal"){
                emat[[i]][1]<-readline(paste("Time of migration change in generations",names(emat[i]),"mean: "))
                emat[[i]][2]<-readline(paste("Time of migration change in generations",names(emat[i]),"Standard Deviation: "))
                }
                if(emat[[i]][3]=="uniform"){
                emat[[i]][1]<-readline(paste("Time of migration change in generations",names(emat[i]),"min: "))
                emat[[i]][2]<-readline(paste("Time of migration change in generations",names(emat[i]),"max: "))
                }
              }
              .GlobalEnv$emat<-emat
              time.menu()},
         
         B = {main.menu()},
         
        # stop("Enter a valid letter!"),
         
         )
  
}

