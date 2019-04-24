# Distance between two covariance matrices

Using the paper "Non-Euclidean statistics for covariance matrices, with applications to diffusion tensor imaging" by Dryden et al. (2009), published on The Annals of Applied Statistics, as source, the hypotesis that the distribution of the main distances between two covariance matrices (cfr. p. 1112) depends only on the number of covariates (p) and the numerosity of two samples (n,m) is tested.

In order to accomplish it, a simulation for every test is launched.
This is the method:
- p,n,m are chosen randomly and fixed.
- 10 different covariance matrices Sigma are chosen
- for each covariance matrix 10000 simulations are run, in order to estimate the distribution given Sigma
- the 10 different distributions are overlapped
- if they're completely different, there's high chance that the distribution depends on Sigma


Euclidean NO

Log-Euclidean YES

Riemannian YES

Cholesky NO

Root Euclidean NO

Procrustes size-and-shape NO

Full Procrustes shape ?

Power Euclidean ?

Each test is perform in the corrispondent *.m Matlab file.


# Test for equality of two covariance matrices

In the Log-Euclidean case, the answer is YES. Therefore, given n,m,p it's possible to numerically compute the distribution function with a random Sigma, for instance the identity matrix.
Known the distribution function, it's possible to determine a test for equality of two covariance matrices.

geodesic.R contains the code with the test above described

test.R contains the code with an example of how to run the test
