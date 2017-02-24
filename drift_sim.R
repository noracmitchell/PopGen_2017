install.packages("colorspace")
library(colorspace)


# create Drift_graph() function (run through final closing squiggly bracket)

Drift_graph = function(t,R, N, p_init){
  
  # define initial values
  p<-p_init
  extinct <- 0
  stable <- 0
  fix <- 0
  
  # run first replicate
  freq<-as.numeric();
    for( i in 1:t ){
      A1=rbinom(1,2*N,p)
      p=A1/(N*2);
      freq[length(freq)+1]<-p;
    }
  
  # plot first replicate
  plot(freq,type="l",ylim=c(0,1),col="black",lwd = 2, xlab="t",ylab=expression(p(A[1])))
     colors <-  rainbow_hcl(10)
   
     # update result 
     if(freq[t]>=1){
        fix <- fix + 1
      }else if(freq[t]<1 && freq[t]>0){
        stable <- stable + 1
      }else if(freq[t]<=0){extinct <- extinct +1}
     
    # run for remaining replicates
    for(u in 1:(R-1)){
      freq1<-as.numeric();
      p<-p_init
        for(j in 1:t ){
          A1=rbinom(1,2*N,p)
          p=A1/(N*2);
          freq1[length(freq1)+1]<-p;
        }
      
     # plot remaining replicates
      lines(freq1,type="l", lwd = 2, col=colors[u])

      # update results again
        if(freq1[t]>=1){
            fix <- fix + 1
          }else if(freq1[t]<1 && freq1[t]>0){
            stable <- stable + 1
          }else if(freq1[t]<=0){
            extinct <- extinct +1
          }
  } 
     
     # print out results
      cat("Results\n",
        "  stable: ", stable, "\n",
        "  fixed:  ", fix, "\n",
        "  extinct:  ", extinct, "\n", sep="")
}

# Run function, change arguments as needed

Drift_graph(t = 1000, R=10, N = 100, p_init = 0.5)

