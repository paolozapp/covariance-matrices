#computing the distribution of the geodesic distance
N <- 1000000;


# geodesic distance for Sigma = I

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

save(geod_density,file = "geod_density")
