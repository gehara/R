
gene.settings$ngenes<-ngenes

print.gene.menu<-function(){
    
    
{cat(paste("A > Number of loci to simulate            ",gene.settings$ngenes),
     paste("B > Samples                               ",gene.settings$samp),
     paste("")
     paste("Q > Quit, my model is Ready!"),
     sep="\n")
}
}

