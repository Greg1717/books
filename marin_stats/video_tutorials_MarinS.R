#' Source of code: https://www.statslectures.com
#' 
## source =====================================================================
url <- "https://www.statslectures.com"

# 1 Starting with R ===========================================================

# 2 Descriptive Statistics ====================================================

## 2.7 Scatterplots ===========================================================

# LungCapData <- read.table(file="http://tiny.cc/econ226/data/LungCapData.txt", header = T, sep = "\t")
# write.csv(x = LungCapData, file = "data/LungCapData.csv", row.names = F)
# remove(LungCapData)
getwd()
LungCapData <- read.csv(file = "./marin_stats/data/LungCapData2.csv")
head(LungCapData)
summary(LungCapData)
# explore relationship between height and age
help(plot)

# Pearson's correlation
attach(LungCapData)
cor(Age, Height)
# => fairly strong linear association
plot(
    Age,
    Height,
    main = "Scatterplot",
    xlab = "Age",
    ylab = "Height",
    las = 1,
    xlim = c(0, 25),
    cex = 0.5,           # size of plotting characters
    pch = 8,             # type of plotting character
    col = 2
)
# add linear regression
abline(lm(Height~Age), col = 4)
# add smoother to the plot
lines(smooth.spline(Age, Height), lty = 2, lwd = 5)


# 3. Probability Distributions ================================================

## 3.1 Binomial Distribution ==================================================

#' X is binomially distributed with n=20 and p=1/6 probability of success:
#' X ~ BIN(n=20, p=1/6)

library(tigerstats)
help(dbinom)

# dbinom is used to find values for the probability density function of X, f(x).
# P(X=3)

dbinom(x = 3, size = 20, prob = 1/6)

dbinom(x = 0:3, size = 20, prob = 1/6)

# same with tigerstats
tigerstats::pbinomGC(
  bound = c(3,3),
  region = "between",
  size = 20,
  prob = 1 / 6,
  graph = T
)

# P(X <= 3)
sum(dbinom(x = 0:3, size = 20, prob = 1/6))

# pbinom command gives us values for the probability distribution function of X, F(x)
pbinom(
  q = 3,
  size = 20,
  prob = 1 / 6,
  lower.tail = T
)

# same with tigerstats
tigerstats::pbinomGC(
  bound = 3,
  region = "below",
  size = 20,
  prob = 1 / 6,
  graph = T
)

# rbinom() function can be used to take a random sample from a binomial distribution.

# qbinom() function: to find quantiles for a binomial distribution.


## 3.2 Poisson Distribution ===================================================
#' X follows a Poisson Distribution with a known rate of lambda=7.
#' X~Poisson(lambda=7)
#' dpois() is used to find values for the probability density function of X, f(x).
#' ppois() returns probabilities associated with the probability distribution function F(x)
#' rpois() returns a random sample from a Poisson Distribution.
#' qpois() returns quantiles for the Poisson Distribution.
help("dpois")

# P(X=4)
dpois(x = 4, lambda = 7)

# P(X<=4)
dpois(x = 0:4, lambda = 7)

# poisson plot
x <- 0:20
plot(x, dpois(x, lambda = 7), type = "h")

# P(X<=7)
dpois(x = 0:7, lambda = 7)

sum(dpois(x = 0:4, lambda = 7))

ppois(q = 4, lambda = 7, lower.tail = T)

# P(X>=12)
ppois(q = 12, lambda = 7, lower.tail = F)


## 3.3 Normal Distribution ====================================================

# X is normally distributed with a known mean of 75 and standard deviation of 5.
# X~N(mu=75, var=5^2)

help("pnorm")

# P(X<=70)
pnorm(q = 70, mean = 75, sd = 5, lower.tail = T)

tigerstats::pnormGC(
  bound = 70,
  region = "below",
  mean = 75,
  sd = 5,
  graph = T
)

# P(X>=85)
pnorm(q = 85, mean = 75, sd = 5, lower.tail = F)

tigerstats::pnormGC(
  bound = 85,
  region = "above",
  mean = 75,
  sd = 5,
  graph = T
)

P(Z >= 1)

pnorm(q = 1, mean = 0, sd = 1, lower.tail = F)

pnormGC(bound = 1, region = "above", mean = 0, sd = 1, graph = T)

# find Q1
qnorm(p = 0.25, mean = 75, sd = 5, lower.tail = T)
qnormGC(area = 0.25, region = "below", mean = 75, sd = 5, graph = T)

# plot the probability density function (pdf)
x <- seq(from = 55, to = 95, by = 0.25)
x

dens <- dnorm(x, mean = 75, sd = 5)

plot(x, dens)

plot(x, dens, type = "l")

plot(
  x,
  dens,
  type = "l",
  main = "X~Normal: mean=75, sd=5",
  xlab = "x",
  ylab = "Probability Density",
  las = 1
)

abline(v=75)

# draw random variables
rand <- rnorm(n=40, mean = 75, sd = 5)

rand

hist(rand)

## 3.4 t-Distribution and t-Scores ============================================
# Finding probabilities and percentiles for t-distribution.
# These can be used to find p-values or critical values for constructing confidence intervals for statistics that follow a t-distribution.
# 
# t~t df=25, mu=0, sd=1

help(pt)
# suppose> t-stat 2.3, df=25
# find: one-sided p-value
# P(t>2.3)
pt(q=2.3, df=25, lower.tail = F)

# two-sided p-value
pt(q=2.3, df=25, lower.tail = F) + pt(q=-2.3, df=25, lower.tail = T)

pt(q=2.3, df=25, lower.tail = F)*2

# 2-sided 95% confidence interval
# find t for 95% confidence
# find value of t with 2.5% in each tail
qt(p = 0.025, df=25, lower.tail = T)

help(pf)
help(pexp)

# 4 Bivariate Analysis ========================================================
## 4.1 One-Sample t-Test
# How to conduct the one-sample t-test and determine one-sample confidence interval for the mean of a single variable.
# 
## __t.test help examples =================================================
require(graphics)

t.test(1:10, y = c(7:20))      # P = .00001855
t.test(1:10, y = c(7:20, 200)) # P = .1245    -- NOT significant anymore

## Classical example: Student's sleep data
sleep
plot(extra ~ group, data = sleep)
## Traditional interface
with(sleep, t.test(extra[group == 1], extra[group == 2]))

## Formula interface
t.test(extra ~ group, data = sleep)



## Formula interface to one-sample test
t.test(extra ~ 1, data = sleep)

## Formula interface to paired test
## The sleep data are actually paired, so could have been in wide format:
sleep2 <- reshape(sleep, direction = "wide", 
                  idvar = "ID", timevar = "group")
sleep2
t.test(Pair(extra.1, extra.2) ~ 1, data = sleep2)
# same as 
t.test(extra ~ group, data = sleep, paired = T)

LungCapData <- read.csv(file = "data/LungCapData.csv")
head(LungCapData)
str(LungCapData)
summary(LungCapData)
help("t.test")
help(stats::t.test)
attach(LungCapData)
boxplot(LungCap)

# test the null hypothesis that the mean is less than 8 
# H0: mu<8
# we want a one-sided confidence interval for the mean (mu)
t.test(x = LungCap, mu = 8, alternative = "less", conf.level = 0.95)

# same with tigerstats
library(tigerstats)
?ttestGC

ttestGC(x = ~LungCap, 
        data = LungCapData, 
        mu = 8,
        alternative = "less", 
        graph = TRUE)

# Two-sided hypothesis test ===================================================
t.test(x = LungCap, mu = 8, alternative = "two.sided", conf.level = 0.95)

ttestGC(x = ~LungCap, 
        data = LungCapData, 
        mu = 8,
        alternative = "two.sided", 
        graph = TRUE)

#' Store test results in an object:
TEST <-
  t.test(
    x = LungCap,
    mu = 8,
    alternative = "two.sided",
    conf.level = 0.99
  )

TEST

#' Attributes:
TEST$conf.int
TEST$p.value

## 4.2 Two-Sample t-Test ======================================================
LungCapData <- read.csv(file = "data/LungCapData.csv")

head(LungCapData)

str(LungCapData)

summary(LungCapData)

attach(LungCapData)

boxplot(LungCap ~ Smoke)

# H0: mean lung capacity of smokers is = of non-smokers
# two-sided test
# assume non-equal variances
t.test(LungCap~Smoke, mu=0, alt="two.sided", conf = 0.95, var.eq=F, paired=F)

# same
t.test(LungCap[Smoke == "no"], LungCap[Smoke == "yes"])
var(LungCap[Smoke == "yes"])
var(LungCap[Smoke == "no"])

# Levene's test
# test H0 that the population variances are equal
library(car)
leveneTest(LungCap~Smoke)

# 4.7 Paired t-Test ===========================================================


## 4.12 Correlation and Covariance ============================================


# 5 Linear Regression =========================================================

## 5.1 Simple Linear Regression ===============================================


## 5.2 Checking Linear Regression Assumptions =================================


## 5.3 Multiple Linear Regression =============================================
