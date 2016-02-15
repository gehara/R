
switch.demog.menu<-function(){
  
  switch(letter,
         A = {prior.dist.Ne<-readline("Ne prior distribution (normal or uniform): ")
         while (prior.dist.Ne %in% c("normal","uniform")==F){
           print("Possible distributions are normal or uniform!")
           prior.dist.Ne<-readline("Ne prior distribution: ")
         }
         .e$n[,6]<-prior.dist.Ne
         if(exists("en",envir=.e)){
           .e$en$size[,6]<-prior.dist.Ne
         }
         sys.frame(which=0)
         demog.menu()},
         
         N = {anc.Ne<-readline("Different ancestral NE (YES or NO?): ")
         if(anc.Ne %in% .e$YES){
           anc.Ne.par()
           demog.menu()
         } else if (exists("en",envir=.e)){
           rm(en, envir=.e)
           demog.menu()
         } else {
           sys.frame(which=0)
           demog.menu()
         }},
         
         P = {xrow<-as.numeric(readline("Which parameter do you want to set up? (write the reference number from the menu): "))
         if(.e$n[1,6]=="normal"){
           .e$n[xrow,4]<-readline(paste("Ne prior (4Nm)",.e$n[xrow,1],"mean: "))
           .e$n[xrow,5]<-readline(paste("Ne prior (4Nm)",.e$n[xrow,1],"Standard Deviation: "))
         }
         if(.e$n[1,6]=="uniform"){
           .e$n[xrow,4]<-readline(paste("Ne prior (4Nm)",.e$n[xrow,1],"min: "))
           .e$n[xrow,5]<-readline(paste("Ne prior (4Nm)",.e$n[xrow,1],"max: "))
         }
         sys.frame(which=0)
         demog.menu()
           },
           
           
         A = {xrow<-readline("Which parameter do you want to set up? (write the reference number from the menu): ")
         if(.e$n[1,6]=="normal"){
           .e$en$size[xrow,4]<-readline(paste("Ancestral Ne prior (4Nm)",.e$en$size[xrow,1],"mean: "))
           .e$en$size[xrow,5]<-readline(paste("Ancestral Ne prior (4Nm)",.e$en$size[xrow,1],"Standard Deviation: "))
         }
         if(.e$n[1,6]=="uniform"){
           .e$en$size[xrow,4]<-readline(paste("Ancestral Ne prior (4Nm)",.e$en$size[xrow,1],"min: "))
           .e$en$size[xrow,5]<-readline(paste("Ancestral Ne prior (4Nm)",.e$en$size[xrow,1],"max: "))
         }
         sys.frame(which=0)
         demog.menu()
         },
         
         B = {sys.frame(which=0)
           main.menu()})
  
}

