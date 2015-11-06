
switch.condition.menu<-function(){
  switch(letter,
         
         s = {place.size.condition()},
         
         t = {place.time.condition()},
              
         
         M = {print(size.matrix)
              paste("--------")
              condition.menu()},
         
         m = {print(time.matrix)
              paste("--------")
              condition.menu()},
         
         B = {main.menu()},    
         
         )}
