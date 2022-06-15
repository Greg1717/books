library(YieldCurve)
# Modelling the yield curve with some parametric models. The models implemented are: Nelson- Siegel, Diebold-Li and Svensson. The package also includes the data of the term structure of interest rate of Federal Reserve Bank and European Central Bank.

### Nelson.Siegel function and Fed data-set ===================================
data(FedYieldCurve)
FedYieldCurve
head(FedYieldCurve)
tail(FedYieldCurve)
str(FedYieldCurve)

rate.Fed = xts::first(FedYieldCurve, '5 month')
rate.Fed
maturity.Fed <- c(3/12, 0.5, 1,2,3,5,7,10)

# Returns the estimated coefficients of the Nelson-Siegel's model:
NSParameters <- Nelson.Siegel(rate = rate.Fed, 
                              maturity = maturity.Fed )
NSParameters

# Returns the interest rates by Nelson-Siegel's model:
y <- NSrates(NSParameters[5,], maturity.Fed) 

plot(maturity.Fed,
     rate.Fed[5,], 
     main="Fitting Nelson-Siegel yield curve", 
     type="o") 

lines(maturity.Fed,
      y, 
      col=2)

legend(
        "topleft",
        legend = c("observed yield curve", "fitted yield curve"),
        col = c(1, 2),
        lty = 1
)

### Svensson function and ECB data-set ========================================

# Yield curve data spot rate, AAA-rated bonds, maturities from 3 months to 30 years
data(ECBYieldCurve)

rate.ECB = ECBYieldCurve[1:5,]

maturity.ECB = c(0.25,0.5,seq(1,30,by=1))

SvenssonParameters <- Svensson(rate.ECB, maturity.ECB) 

Svensson.rate <- Srates( SvenssonParameters,
                         maturity.ECB,
                         "Spot")

plot(maturity.ECB, 
     rate.ECB[5,],
     main="Fitting Svensson yield curve", 
     type="o") 

lines(maturity.ECB, Svensson.rate[5,], col=2) 

legend(
        "topleft",
        legend = c("observed yield curve", "fitted yield curve"),
        col = c(1, 2),
        lty = 1
)
