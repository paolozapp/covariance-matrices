Geodesic_covariance_test <- function(x,y,N=10000){
  if(!dim(x)[2]==dim(y)[2]) {
    stop("Dimensions of the inputs don't match.")
  } 
  beginningtime <- Sys.time()
  p <- dim(x)[2];
  n <- dim(x)[1];
  m <- dim(y)[1];
  
  Sx <- matrix(rep(0,p*p),p,p);
  for (j in 1:n) {
    Sx <- Sx + x[j,] %*% t(x[j,]);
  }
  
  Sy <- matrix(rep(0,p*p),p,p);
  for (j in 1:m) {
    Sy <- Sy + y[j,] %*% t(y[j,]);
  }

  geod_density = NULL;
  
  gauss <- rnorm(p*(n+m)*N);
  
  for (i in seq(0,N-1)) {
    
    S1 <- matrix(rep(0,p*p),p,p);
    for (j in seq(0,n-1)) {
      #z1 <- rnorm(p);
      z1 <- gauss[seq(1+p*j+n*p*i,p+p*j+n*p*i)];
      S1 <- S1 + z1 %*% t(z1);
    }
    
    S2 <- matrix(rep(0,p*p),p,p);
    for (j in 1:m) {
      #z2 <- rnorm(p);
      z2 <- gauss[seq(1+p*j+n*p*i+p*n*N,p+p*j+n*p*i+p*n*N)];
      S2 <- S2 + z2 %*% t(z2);
    }
    
    # T1 <- matrix(rep(0,p*p),p,p);
    # for (i in 1:p-1) {
    #   T1[i,i] <- sqrt(rchisq(1,n-i+1));
    #   for (j in seq(i+1,p)) {
    #     T1[i,j] <- rnorm(1);
    #   }
    # }
    # T1[p,p] <- sqrt(rchisq(1,n-p+1));
    # S1 <- T1 %*% t(T1);
    # 
    # 
    # T2 <- matrix(rep(0,p*p),p,p);
    # for (i in 1:p-1) {
    #   T2[i,i] <- sqrt(rchisq(1,n-i+1));
    #   for (j in seq(i+1,p)) {
    #     T2[i,j] <- rnorm(1);
    #   }
    # }
    # T2[p,p] <- sqrt(rchisq(1,n-p+1));
    # S2 <- T2 %*% t(T2);
    
    geod_density <- c(geod_density,frobenius.norm(logm(S1)-logm(S2)));
  }
  
  test <- frobenius.norm(logm(Sx)-logm(Sy));
  pvalue <- sum(test<geod_density)/length(geod_density);
  
  endtime <- Sys.time()
  
  list(pvalue = pvalue, test = test, time = round((endtime-beginningtime),digits = 2))
  
}
