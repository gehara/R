
switch.condition.menu<-function(){
  switch(letter, 
         
         s = {place.size.condition()},
         
         m = {place.mig.condition()},
         
         t = {place.time.condition()},
              
         
         "1" = {print(.e$size.matrix)
                print("-----------------")
                condition.menu()},
         
         "2" = {print(.e$mig.matrix)
                print("-----------------")
                condition.menu()},
         
         "3" = {print(.e$time.matrix)
                print("-----------------")
                condition.menu()},
         
         B = {sys.frame(which = 0)
              main.menu()}    
         
         )}
