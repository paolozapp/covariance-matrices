Geodesic_covariance_test <- function(x,y,N=10000){
  if(!dim(x)[2]==dim(y)[2]) {
    stop("Dimensions of the inputs don't match.")
  } 
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
  
  for (i in 1:N) {
    
    z1 <- mvrnorm(n,rep(0,p),diag(p));
    z2 <- mvrnorm(m,rep(0,p),diag(p));
    
    S1 <- matrix(rep(0,p*p),p,p);
    for (j in 1:n) {
      S1 <- S1 + z1[j,] %*% t(z1[j,]);
    }
    
    S2 <- matrix(rep(0,p*p),p,p);
    for (j in 1:m) {
      S2 <- S2 + z2[j,] %*% t(z2[j,]);
    }
    
    geod_density <- c(geod_density,frobenius.norm(logm(S1)-logm(S2)));
  }
  
  test <- frobenius.norm(logm(Sx)-logm(Sy));
  pvalue <- sum(test<geod_density)/length(geod_density);
  
  list(pvalue = pvalue, test = test)
  
}
