### Supplementary R code related to "Robust Inference in the Negative Binomial Regression Model with an Application to Falls Data"
### by William H. Aeberhard, Eva Cantoni and Stephane Heritier, May 2014

### Set up
rm(list=ls())
library(MASS) # for glm.nb
source('glmrob.nb.r') # main function, estimates coefficients and standard errors

### Data generation
set.seed(4183) # not necessary, just for replication of results
n <- 250 # sample size
designX <- cbind(rep(1,n),rnorm(n),c(rep(0,n/2),rep(1,n/2))) # same design as in paper
beta <- c(0.5,0.8,-0.4) # same parameter values as in paper
mu <- exp(designX%*%beta) # mean vector
sigma <- 0.7 # overdispersion parameter
y <- rnbinom(n=n,mu=mu,size=1/sigma) # generate response vector

### Estimations at the model (no contamination)
ml.est <- glm.nb(y~designX[,-1]) # MLE
rob.est <- glmrob.nb(y=y,X=designX,bounding.func='T/T',c.tukey.beta=6,c.tukey.sig=4,weights.on.x='none')
# compare estimates and standard errors of beta
summary(ml.est)$coef[,1:2]
cbind(rob.est$coef[-1],rob.est$stdev)
# compare estimates of sigma
1/ml.est$theta
rob.est$coef[1]

### Estimations under contamination in the response
epsi <- 0.05 # proportion of contamination
add <- 20 # magnitude of contamination
whichcontam <- sample(1:n,epsi*n) # simple random sampling without replacement
ycont <- y
ycont[whichcontam] <- y[whichcontam]+add # contaminated response vector
ml.est.cont <- glm.nb(ycont~designX[,-1]) # MLE
rob.est.cont <- glmrob.nb(y=ycont,X=designX,bounding.func='T/T',c.tukey.beta=6,c.tukey.sig=4,weights.on.x='none')
# compare estimates and standard errors of beta
summary(ml.est.cont)$coef[,1:2] # betas now biased
cbind(rob.est.cont$coef[-1],rob.est.cont$stdev) # not much different from estimates at the model, stable
# compare estimates of sigma
1/ml.est.cont$theta # overestimated
rob.est.cont$coef[1] # rather stable

### END
