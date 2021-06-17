library(MASS)
mu <- runif(10, -0.5, 0.5)
Sigma <- matrix(0, 10, 10)
rho <- 0.3
for(i in 1:10){
  for(j in 1:10){
    Sigma[i,j] <- rho ** abs(i-j)
  }
}
X <- mvrnorm(n = 300, mu = mu, Sigma = Sigma)
data <- as.data.frame(X)