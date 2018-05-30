#  White a program to estimate the integralR0.75 0 e−x2dx, but instead of uniform random variables on [0,0.75], 
# Question 1) (10 points) use importance sampling with exponential random variables on [0,0.75], i.e., a random variable with a probability density function
#    e−z 1−e−0.75 , 0 ≤ z ≤ 0.75.
# The random variables with the above distribution should be obtained by pseudo-random numbers using the inverse cumulative distribution transformation. Use a sample size of 1000. What is your estimate of the integral and 99% conﬁdence interval for your estimate? How does the width of the conﬁdence interval compare to the cases of simple Monte Carlo and control variates (results of homework 6)? 
# Question 2) (10 points) use antithetic varaites, with uniform random variables on [0,0.75]. Again, use a sample size of 1000. What is your estimate of the integral and 99% conﬁdence interval for your estimate? How does the width of the conﬁdence interval compare to the cases of simple Monte Carlo and control variates (results of homework 6)? Can you explain the reason?

n <- 1000
z <- runif(n)
x <- -log(1-z*(1-exp(-0.75)))
f <- exp(-x^2)
u <- exp(-x)/(1-exp(-0.75))
g <- f/u
mu <- mean(g)
error <- 2.58*sd(g)/sqrt(n)
CI <- c(mu-error,mu+error)
mu
CI
2*error
# [1] 0.007495546

#The estimate of the integral with importance sampling is 0.6321084 and the 99%    confidence interval is (0.6284550, 0.6357618). The width of the simple Monte Carlo estimator is 0.0165146 and the width of the control variate is 0.0031214. The width of the importance sampling error is 0.007306826. The antithetic estimator is much better than the simple Monte Carlo estimator but a little bit worse than the control variate estimator.

# R code - Question 2

#From r-code AntiVarIntegral.R
n<-1000
x1<-0.75*runif(n/2)
tilde_x1<-0.75-x1 #Since we are only U[0,0.75], 0.75 is our maximum
est1_ae<-1/2*(0.75*mean(exp(-x1^2))+0.75*mean(exp(-tilde_x1^2)))
est1_ae
sigma<-sd(1/2*(-0.75*exp(-x1^2)-0.75*exp(-tilde_x1^2)))
error_ae<-2.58*sigma/sqrt(n/2)
CI<-c(est1_ae-error_ae,est1_ae+error_ae)
CI
# [1] 0.6281014 0.6324614
est1_ae
# [1] 0.6302814
2*error_ae
# [1] 0.004360037
0.6365489-0.6200343 #Simple Monte Carlo
# [1] 0.0165146
0.6312946-0.6281732 #Control Variate
# [1] 0.0031214

#The antithetic estimate of the integral is 0.6303529 and the 99% confidence interval is       (0.6281913, 0.6325145). The width of the simple Monte Carlo estimator error is 0.0165146 and the width of the control variate error is 0.0031214. The width of the antithetic error  is 0.004323161. The antithetic estimator is much better than the simple Monte Carlo estimator but roughly half as good as the control variate.

