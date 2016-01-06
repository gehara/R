
switch.demog.menu<-function(){
  n<-.e$n
  ejNe<-.e$ejNe
  enNe<-.e$enNe
  switch(letter,
         A = {prior.dist.Ne<-readline("Ne prior distribution (normal or uniform): ")
              
              for(i in 1:length(n)){
                n[[i]][3]<-prior.dist.Ne
              }
              for(i in 1:length(ejNe)){
                ejNe[[i]][3]<-prior.dist.Ne
              }
              if(exists("enNe", envir=.e)){
              for(i in 1:length(enNe)){
                enNe[[i]][3]<-prior.dist.Ne
              }
              .e$enNe<-enNe
              } else {}
              .e$n<-n
              .e$ejNe<-ejNe
                          
              demog.menu()},
         
         P = {
           for(i in 1:length(n)){
           if(n[[i]][3]=="normal"){
             n[[i]][1]<-readline(paste("Ne prior (2N)",names(n[i]),"mean: "))
             n[[i]][2]<-readline(paste("Ne prior (2N)",names(n[i]),"Standard Deviation: "))
           }
           if(n[[i]][3]=="uniform"){
             n[[i]][1]<-readline(paste("Historical Ne prior (2N)",names(n[i]),"min: "))
             n[[i]][2]<-readline(paste("Historical Ne prior (2N)",names(n[i]),"max: "))
           }
           }
           for(i in 1:length(ejNe)){
            if(ejNe[[i]][3]=="normal"){
              ejNe[[i]][1]<-readline(paste("Ne prior (2N)",names(ejNe[i]),"mean: "))
              ejNe[[i]][2]<-readline(paste("Ne prior (2N)",names(ejNe[i]),"Standard Deviation: "))
              }
            if(ejNe[[i]][3]=="uniform"){
             ejNe[[i]][1]<-readline(paste("Historical Ne prior (2N)",names(ejNe[i]),"min: "))
             ejNe[[i]][2]<-readline(paste("Historical Ne prior (2N)",names(ejNe[i]),"max: "))
              }
            }
           .e$ejNe<-ejNe
           .e$n<-n
           demog.menu()
           },
           
           
         p = {  
              for(i in 1:length(enNe)){
                if(enNe[[i]][3]=="normal"){
                enNe[[i]][1]<-readline(paste("Historical Ne prior (2N)",names(enNe[i]),"mean: "))
                enNe[[i]][2]<-readline(paste("Historical Ne prior (2N)",names(enNe[i]),"Standard Deviation: "))
                }
                if(enNe[[i]][3]=="uniform"){
                enNe[[i]][1]<-readline(paste("Historical Ne prior (2N)",names(enNe[i]),"min: "))
                enNe[[i]][2]<-readline(paste("Historical Ne prior (2N)",names(enNe[i]),"max: "))
                }
              }
              .e$enNe<-enNe
              demog.menu()},
         
         B = {main.menu()}
         
         
         )
  
}

