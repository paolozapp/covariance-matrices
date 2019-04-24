library(MASS)

p <- 4;
n <- round(3*p+40*runif(1));
m <- round(3*p+40*runif(1));

mu <- rep(0,p);
Sigma <- matrix(c(8,1,-1,1,1,6,1,-2,-1,1,6,1,1,-2,1,7),p,p);
x <- mvrnorm(n,mu,Sigma);
y <- mvrnorm(m,mu,Sigma);

pfisher <- Fisher_covariance_test(x,y); #magari creare una classe
