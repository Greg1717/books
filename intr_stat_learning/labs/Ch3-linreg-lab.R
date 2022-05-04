# Lab: Linear Regression
## Libraries
library(MASS)
library(ISLR2)

## Simple Linear Regression ===================================================
head(Boston)
?Boston
# lstat: lower status of the population (percent).
# medv: median value of owner-occupied homes in \$1000s.

lm.fit <- lm(medv ~ lstat, data = Boston)
attach(Boston)
lm.fit <- lm(medv ~ lstat)
lm.fit
summary(lm.fit)
names(lm.fit)
coef(lm.fit)
confint(lm.fit)

# _predict ===================================================================
predict(lm.fit, 
        data.frame(lstat = (c(5, 10, 15))),
        interval = "confidence")

predict(lm.fit, 
        data.frame(lstat = (c(5, 10, 15))),
        interval = "prediction")

# _plot =======================================================================
par(las = 0)
plot(lstat, medv)
abline(lm.fit)
abline(lm.fit, lwd = 3)
abline(lm.fit, lwd = 3, col = "red")
plot(lstat, medv, col = "red")
plot(lstat, medv, pch = 20)
plot(lstat, medv, pch = "+")
plot(1:20, 1:20, pch = 1:20)

# _diagnostic plots ==========================================================
par(mfrow = c(2, 2))
plot(lm.fit)

# _predict vs residuals ========
plot(predict(lm.fit), residuals(lm.fit))
# _predict vs studentized ======
plot(predict(lm.fit), rstudent(lm.fit))

plot(hatvalues(lm.fit))
which.max(hatvalues(lm.fit))

## Multiple Linear Regression =================================================
lm.fit <- lm(medv ~ lstat + age, data = Boston)
summary(lm.fit)

lm.fit <- lm(medv ~ ., data = Boston)
summary(lm.fit)

# __vif ======
# variance inflation factor
library(car)
vif(lm.fit)

# exclude age as p-value high
lm.fit1 <- lm(medv ~ . - age, data = Boston)
summary(lm.fit1)

lm.fit1 <- update(lm.fit, ~ . - age)


## _Interaction Terms ========================================================

summary(lm(medv ~ lstat * age, data = Boston))

## Non-linear Transformations of the Predictors
lm.fit2 <- lm(medv ~ lstat + I(lstat^2))
summary(lm.fit2)

lm.fit <- lm(medv ~ lstat)

# _anova =========
anova(lm.fit, lm.fit2)

par(mfrow = c(2, 2))
plot(lm.fit2)

# _poly ==== 
lm.fit5 <- lm(medv ~ poly(lstat, 5))
summary(lm.fit5)

summary(lm(medv ~ log(rm), data = Boston))

## Qualitative Predictors =====================================================
Carseats <- ISLR2::Carseats
head(Carseats)

lm.fit <- lm(Sales ~ . + Income:Advertising + Price:Age, 
    data = Carseats)

summary(lm.fit)

attach(Carseats)
contrasts(ShelveLoc)
?Contrasts

## Writing  Functions =========================================================
LoadLibraries
LoadLibraries()

LoadLibraries <- function() {
 library(ISLR2)
 library(MASS)
 print("The libraries have been loaded.")
}

LoadLibraries
LoadLibraries()

