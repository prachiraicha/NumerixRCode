# Suppose that X1, X2,... are IID random variables with cumulative distribution function: F(x) = 1 1 + e−2x , −∞ < x < ∞. Evaluate P(X1 + ... + X10 ≥ 1) using a Monte Carlo method with an error of no more than 0.01 with 99% conﬁdence. (starting with uniform random numbers) 

n1<-1000
n2<-1000
n3<-1000
n4<-1000
n5<-1000
n6<-1000
n7<-1000
n8<-1000
n9<-1000
n10<-1000

x1<-runif(n1) #Random variable for each n samples
x2<-runif(n2) #Probably a more elegant way to do this
x3<-runif(n3)
x4<-runif(n4)
x5<-runif(n5)
x6<-runif(n6)
x7<-runif(n7)
x8<-runif(n8)
x9<-runif(n9)
x10<-runif(n10)

y1<--log(1/x1-1)/2
y2<--log(1/x2-1)/2
y3<--log(1/x3-1)/2
y4<--log(1/x4-1)/2
y5<--log(1/x5-1)/2
y6<--log(1/x6-1)/2
y7<--log(1/x7-1)/2
y8<--log(1/x8-1)/2
y9<--log(1/x9-1)/2
y10<--log(1/x10-1)/2

z<-ifelse((y1+y2+y3+y4+y5+y6+y7+y8+y9+y10)>1,1,0) #If the sum is >1 then you get a 1 otherwise a 0, when you take the mean of this you get a probability
mean(z)

#Find the optimal n after testing 1000 trials
nu<-(2.58*1.1*sd(z)/0.01)^2
nu
# [1] 18039.89

n1<-(2.58*1.1*sd(z)/0.01)^2
n2<-(2.58*1.1*sd(z)/0.01)^2
n3<-(2.58*1.1*sd(z)/0.01)^2
n4<-(2.58*1.1*sd(z)/0.01)^2
n5<-(2.58*1.1*sd(z)/0.01)^2
n6<-(2.58*1.1*sd(z)/0.01)^2
n7<-(2.58*1.1*sd(z)/0.01)^2
n8<-(2.58*1.1*sd(z)/0.01)^2
n9<-(2.58*1.1*sd(z)/0.01)^2
n10<-(2.58*1.1*sd(z)/0.01)^2

x1<-runif(n1)
x2<-runif(n2)
x3<-runif(n3)
x4<-runif(n4)
x5<-runif(n5)
x6<-runif(n6)
x7<-runif(n7)
x8<-runif(n8)
x9<-runif(n9)
x10<-runif(n10)

y1<--log(1/x1-1)/2
y2<--log(1/x2-1)/2
y3<--log(1/x3-1)/2
y4<--log(1/x4-1)/2
y5<--log(1/x5-1)/2
y6<--log(1/x6-1)/2
y7<--log(1/x7-1)/2
y8<--log(1/x8-1)/2
y9<--log(1/x9-1)/2
y10<--log(1/x10-1)/2

z<-ifelse((y1+y2+y3+y4+y5+y6+y7+y8+y9+y10)>1,1,0)
mean(z)
# [1] 0.3653196
