
join.par<-function()
  {
  ## get topology and number of nodes
  if(npops>2){
    .GlobalEnv$tree<-readline("write topology in newick format (don't forget the semicolon at the end): ")
    tree<-.GlobalEnv$tree
    tree<-strsplit(tree,"")
    .GlobalEnv$junctions<-as.numeric(length(grep("[(]",tree[[1]])))
    junctions<-.GlobalEnv$junctions
  } else {.GlobalEnv$tree<-"(1,2);"
          .GlobalEnv$junctions<-1
          junctions<-.GlobalEnv$junctions
  }
  ## generate paraeters of time of join of populations   
  tot.join.par<-NULL
    for (i in 1:junctions){
      join.par<-paste("join",i,sep="")
      tot.join.par<-c(tot.join.par,join.par)
    }
    n.join.par<-as.numeric(length(tot.join.par))
    x<-vector(mode="list", length=n.join.par)
    names(x)<-tot.join.par
    tot.join.par<-x

    for(i in 1:length(tot.join.par)){
      tot.join.par[[i]][1]<-100000
      tot.join.par[[i]][2]<-1000000
      tot.join.par[[i]][3]<-"uniform"
    }
    ## write parameters to list in the global environment 
    .GlobalEnv$ejt<-tot.join.par

    ## generate ancestral population size parameters at the time of the junction
    Ne.anc.join<-NULL
    for (i in 1:n.join.par){
      Ne.anc<-paste("Ne.anc.join",i, sep="")
      Ne.anc.join<-c(Ne.anc.join, Ne.anc)
    }
    n.Ne.anc<-vector(mode="list", length=length(tot.join.par))
    names(n.Ne.anc)<-Ne.anc.join
    Ne.anc.join<-n.Ne.anc


    for(i in 1:length(Ne.anc.join)){
      Ne.anc.join[[i]][1]<-10000
      Ne.anc.join[[i]][2]<-100000
      Ne.anc.join[[i]][3]<-"uniform"
    }
    ## write ancestral pop size list to the global env 
    .GlobalEnv$ejNe<-Ne.anc.join
    
    ## get joint matrix (depend on ape)
    # write tree to file
    writeLines(.GlobalEnv$tree,con="tree.txt")
    # read tree
    tree<-read.tree("tree.txt")
    # get the tips
    tips<-tree$tip.label
    # get the topology matrix
    join.matrix<-as.matrix(tree$edge)
    # assign names to the matrix columns
    colnames(join.matrix)<-c("anc","pop")
    
    ## rearange tips
    y<-NULL
    for(i in 1:length(tips)){
      x<-grep(i,join.matrix[,2])
      y<-c(y,x)
    }
    for(i in 1:length(tips)){
      join.matrix[y[i],2]<-tips[i]
    }
  
    ## substitute tip numbers by pop names (parameter names)
    for(i in 1:npops){
      join.matrix[,2]<-as.matrix(gsub(i,names(.GlobalEnv$n[i]),join.matrix[,2]))
      join.matrix[,1]<-as.matrix(gsub(i,names(.GlobalEnv$n[i]),join.matrix[,1]))
    }
    ##
    for(i in 1:.GlobalEnv$junctions){
      join.matrix[,2]<-as.matrix(gsub(i+npops,names(tail(.GlobalEnv$ejNe,n=i)[1]),join.matrix[,2]))
      join.matrix[,1]<-as.matrix(gsub(i+npops,names(tail(.GlobalEnv$ejNe,n=i)[1]),join.matrix[,1]))  
    }
    
  .GlobalEnv$join.matrix<-join.matrix
  
}

