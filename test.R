library(MASS)
library(matrixcalc)
library(matrixStats)
library(expm)

p <- 4;
n <- round(5*p+40*runif(1));
m <- round(5*p+40*runif(1));

#same Sigma: pvalue should be high

mu <- rep(0,p);
Sigma <- matrix(c(8,1,-1,1,1,6,1,-2,-1,1,6,1,1,-2,1,7),p,p);
x <- mvrnorm(n,mu,Sigma);
y <- mvrnorm(m,mu,Sigma);

geodesic <- Geodesic_covariance_test(x,y);
geodesic$pvalue

#different Sigma: pvalue should be low
Sigma2 <- matrix(c(10,-1,0,1,-1,6,0,0,0,0,8,-1,1,0,-1,6),p,p);
x <- mvrnorm(n,mu,Sigma);
y <- mvrnorm(m,mu,Sigma2);

geodesic2 <- Geodesic_covariance_test(x,y);
geodesic2$pvalue
