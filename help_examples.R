# anova.lm ====================================================================
# Compute an analysis of variance table for one or more linear model fits.
## sequential table
fit <- lm(sr ~ ., data = LifeCycleSavings)
anova(fit)

## same effect via separate models
fit0 <- lm(sr ~ 1, data = LifeCycleSavings)
fit1 <- update(fit0, . ~ . + pop15)
fit2 <- update(fit1, . ~ . + pop75)
fit3 <- update(fit2, . ~ . + dpi)
fit4 <- update(fit3, . ~ . + ddpi)
anova(fit0, fit1, fit2, fit3, fit4, test = "F")

anova(fit4, fit2, fit0, test = "F") # unconventional order


# aov =========================================================================
## Set orthogonal contrasts.
op <- options(contrasts = c("contr.helmert", "contr.poly"))
(npk.aov <- aov(yield ~ block + N * P * K, npk))
summary(npk.aov)
coefficients(npk.aov)

## to show the effects of re-ordering terms contrast the two fits
aov(yield ~ block + N * P + K, npk)
aov(terms(yield ~ block + N * P + K, keep.order = TRUE), npk)

## as a test, not particularly sensible statistically
npk.aovE <- aov(yield ~  N * P * K + Error(block), npk)
npk.aovE
## IGNORE_RDIFF_BEGIN
summary(npk.aovE)
## IGNORE_RDIFF_END
options(op)  # reset to previous

# ggpairs =====================================================================
# Make a matrix of plots with a given data set

# small function to display plots only if it's interactive
p_ <- GGally::print_if_interactive

## Quick example, with and without colour
data(flea)
flea
ggpairs(flea, columns = 2:4)
pm <- ggpairs(flea, columns = 2:4, ggplot2::aes(colour = species))
p_(pm)

# Note: colour should be categorical, else you will need to reset
# the upper triangle to use points instead of trying to compute corr
data(tips, package = "reshape")
pm <- ggpairs(tips[, 1:3])
p_(pm)
pm <-
        ggpairs(tips, 1:3, columnLabels = c("Total Bill", "Tip", "Sex"))
p_(pm)
pm <- ggpairs(tips, upper = "blank")
p_(pm)

## Plot Types
# Change default plot behavior
pm <- ggpairs(
        tips[, c(1, 3, 4, 2)],
        upper = list(continuous = "density", combo = "box_no_facet"),
        lower = list(continuous = "points", combo = "dot_no_facet")
)
p_(pm)
# Supply Raw Functions (may be user defined functions!)
pm <- ggpairs(
        tips[, c(1, 3, 4, 2)],
        upper = list(continuous = ggally_density, combo = ggally_box_no_facet),
        lower = list(continuous = ggally_points, combo = ggally_dot_no_facet)
)
p_(pm)

# Use sample of the diamonds data
data(diamonds, package = "ggplot2")
diamonds.samp <- diamonds[sample(1:dim(diamonds)[1], 1000),]

# Different aesthetics for different plot sections and plot types
pm <- ggpairs(
        diamonds.samp[, 1:5],
        mapping = ggplot2::aes(color = cut),
        upper = list(
                continuous = wrap("density", alpha = 0.5),
                combo = "box_no_facet"
        ),
        lower = list(
                continuous = wrap("points", alpha = 0.3),
                combo = wrap("dot_no_facet", alpha = 0.4)
        ),
        title = "Diamonds"
)
p_(pm)

## Axis Label Variations
# Only Variable Labels on the diagonal (no axis labels)
pm <- ggpairs(tips[, 1:3], axisLabels = "internal")
p_(pm)
# Only Variable Labels on the outside (no axis labels)
pm <- ggpairs(tips[, 1:3], axisLabels = "none")
p_(pm)

## Facet Label Variations
#  Default:
df_x <- rnorm(100)
df_y <- df_x + rnorm(100, 0, 0.1)
df <- data.frame(x = df_x,
                 y = df_y,
                 c = sqrt(df_x ^ 2 + df_y ^ 2))

pm <- ggpairs(df,
              columnLabels = c(
                      "alpha[foo]",
                      "alpha[bar]",
                      "sqrt(alpha[foo]^2 + alpha[bar]^2)"
              ))
p_(pm)

#  Parsed labels:
pm <- ggpairs(
        df,
        columnLabels = c(
                "alpha[foo]",
                "alpha[bar]",
                "sqrt(alpha[foo]^2 + alpha[bar]^2)"
        ),
        labeller = "label_parsed"
)
p_(pm)

## Plot Insertion Example
custom_car <-
        ggpairs(mtcars[, c("mpg", "wt", "cyl")],
                upper = "blank",
                title = "Custom Example")

# ggplot example taken from example(geom_text)
plot <-
        ggplot2::ggplot(mtcars, ggplot2::aes(
                x = wt,
                y = mpg,
                label = rownames(mtcars)
        ))
plot <- plot +
        ggplot2::geom_text(ggplot2::aes(colour = factor(cyl)), size = 3) +
        ggplot2::scale_colour_discrete(l = 40)
custom_car[1, 2] <- plot
personal_plot <- ggally_text("ggpairs allows you\nto put in your\nown plot.\nLike that one.\n <---")
custom_car[1, 3] <- personal_plot
p_(custom_car)

## Remove binwidth warning from ggplot2
# displays warning about picking a better binwidth
pm <- ggpairs(tips, 2:3)
p_(pm)
# no warning displayed
pm <-
        ggpairs(tips, 2:3, lower = list(combo = wrap("facethist", binwidth = 0.5)))
p_(pm)
# no warning displayed with user supplied function
pm <-
        ggpairs(tips, 2:3, lower = list(combo = wrap(ggally_facethist, binwidth = 0.5)))
p_(pm)

## Remove panel grid lines from correlation plots
pm <- ggpairs(flea,
              columns = 2:4,
              upper = list(continuous = wrap(ggally_cor, displayGrid = FALSE)))
p_(pm)

## Custom with/height of subplots
pm <- ggpairs(tips, columns = c(2, 3, 5))
p_(pm)

pm <- ggpairs(tips, columns = c(2, 3, 5), proportions = "auto")
p_(pm)

pm <- ggpairs(tips,
              columns = c(2, 3, 5),
              proportions = c(1, 3, 2))
p_(pm)


# glm =========================================================================
# glm is used to fit generalized linear models, specified by giving a symbolic description of the linear predictor and a description of the error distribution.

## Dobson (1990) Page 93: Randomized Controlled Trial :
counts <- c(18, 17, 15, 20, 10, 20, 25, 13, 12)
outcome <- gl(3, 1, 9)
treatment <- gl(3, 3)
data.frame(treatment, outcome, counts) # showing data
glm.D93 <- glm(counts ~ outcome + treatment, family = poisson())
anova(glm.D93)
summary(glm.D93)
## Computing AIC [in many ways]:
(A0 <- AIC(glm.D93))
(ll <- logLik(glm.D93))
A1 <- -2 * c(ll) + 2 * attr(ll, "df")
A2 <- glm.D93$family$aic(counts, mu = fitted(glm.D93), wt = 1) +
        2 * length(coef(glm.D93))
stopifnot(exprs = {
        all.equal(A0, A1)
        all.equal(A1, A2)
        all.equal(A1, glm.D93$aic)
})


## an example with offsets from Venables & Ripley (2002, p.189)
utils::data(anorexia, package = "MASS")

anorex.1 <- glm(Postwt ~ Prewt + Treat + offset(Prewt),
                family = gaussian,
                data = anorexia)
summary(anorex.1)


# A Gamma example, from McCullagh & Nelder (1989, pp. 300-2)
clotting <- data.frame(
        u = c(5, 10, 15, 20, 30, 40, 60, 80, 100),
        lot1 = c(118, 58, 42, 35, 27, 25, 21, 19, 18),
        lot2 = c(69, 35, 26, 21, 18, 16, 13, 12, 12)
)
summary(glm(lot1 ~ log(u), data = clotting, family = Gamma))
summary(glm(lot2 ~ log(u), data = clotting, family = Gamma))
## Aliased ("S"ingular) -> 1 NA coefficient
(fS <-
                glm(lot2 ~ log(u) + log(u ^ 2), data = clotting, family = Gamma))
tools::assertError(update(fS, singular.ok = FALSE), verbose = interactive())
## -> .. "singular fit encountered"

## Not run:
## for an example of the use of a terms object as a formula
demo(glm.vr)

## End(Not run)

# influence.measures ==========================================================

# Regression Deletion Diagnostics
# Description
# This suite of functions can be used to compute some of the regression (leave-one-out deletion) diagnostics for linear and generalized linear models.

require(graphics)

## Analysis of the life-cycle savings data
## given in Belsley, Kuh and Welsch.
lm.SR <- lm(sr ~ pop15 + pop75 + dpi + ddpi, data = LifeCycleSavings)

inflm.SR <- influence.measures(lm.SR)

which(apply(inflm.SR$is.inf, 1, any))
# which observations 'are' influential
summary(inflm.SR) # only these
inflm.SR          # all
plot(rstudent(lm.SR) ~ hatvalues(lm.SR)) # recommended by some
plot(lm.SR, which = 5) # an enhanced version of that via plot(<lm>)

## The 'infl' argument is not needed, but avoids recomputation:
rs <- rstandard(lm.SR)
iflSR <- influence(lm.SR)
all.equal(rs, rstandard(lm.SR, infl = iflSR), tol = 1e-10)
## to "see" the larger values:
1000 * round(dfbetas(lm.SR, infl = iflSR), 3)
cat("PRESS :"); (PRESS <- sum( rstandard(lm.SR, type = "predictive")^2 ))
stopifnot(all.equal(PRESS, sum( (residuals(lm.SR) / (1 - iflSR$hat))^2)))

## Show that "PRE-residuals"  ==  L.O.O. Crossvalidation (CV) errors:
X <- model.matrix(lm.SR)
y <- model.response(model.frame(lm.SR))
## Leave-one-out CV least-squares prediction errors (relatively fast)
rCV <- vapply(seq_len(nrow(X)), function(i)
        y[i] - X[i,] %*% .lm.fit(X[-i,], y[-i])$coef,
        numeric(1))
## are the same as the *faster* rstandard(*, "pred") :
stopifnot(all.equal(rCV, unname(rstandard(lm.SR, type = "predictive"))))


## Huber's data [Atkinson 1985]
xh <- c(-4:0, 10)
yh <- c(2.48, .73, -.04, -1.44, -1.32, 0)
lmH <- lm(yh ~ xh)
summary(lmH)
im <- influence.measures(lmH)
im 
plot(xh,yh, main = "Huber's data: L.S. line and influential obs.")
abline(lmH); points(xh[im$is.inf], yh[im$is.inf], pch = 20, col = 2)

## Irwin's data [Williams 1987]
xi <- 1:5
yi <- c(0,2,14,19,30)    # number of mice responding to dose xi
mi <- rep(40, 5)         # number of mice exposed
glmI <- glm(cbind(yi, mi -yi) ~ xi, family = binomial)
summary(glmI)
signif(cooks.distance(glmI), 3)   # ~= Ci in Table 3, p.184
imI <- influence.measures(glmI)
imI 
stopifnot(all.equal(imI$infmat[,"cook.d"],
                    cooks.distance(glmI)))

# lm ==========================================================================
require(graphics)

ctl <- c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14)

trt <- c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)

group <- gl(n = 2, k = 10, length = 20, labels = c("Ctl","Trt"))

weight <- c(ctl, trt)

lm.D9 <- lm(weight ~ group)

lm.D90 <- lm(weight ~ group - 1) # omitting intercept

summary(lm.D9)
anova(lm.D9)

summary(lm.D90)
anova(lm.D90)

opar <- par(mfrow = c(2,2), oma = c(0, 0, 1.1, 0))
plot(lm.D9, las = 1)      # Residuals, Fitted, ...
par(opar)

# summary.lm ==================================================================
##-- Continuing the  lm(.) example:
coef(lm.D90)  # the bare coefficients
sld90 <- summary(lm.D90 <- lm(weight ~ group -1))  # omitting intercept
sld90
coef(sld90)  # much more

## model with *aliased* coefficient:
lm.D9. <- lm(weight ~ group + I(group != "Ctl"))
Sm.D9. <- summary(lm.D9.)
Sm.D9. #  shows the NA NA NA NA  line


# xtabs =======================================================================
## 'esoph' has the frequencies of cases and controls for all levels of
## the variables 'agegp', 'alcgp', and 'tobgp'.
esoph
head(esoph)
xtabs(cbind(ncases, ncontrols) ~ ., data = esoph)

## Output is not really helpful ... flat tables are better:
ftable(xtabs(cbind(ncases, ncontrols) ~ ., data = esoph))

## In particular if we have fewer factors ...
ftable(xtabs(cbind(ncases, ncontrols) ~ agegp, data = esoph))

## This is already a contingency table in array form.
DF <- as.data.frame(UCBAdmissions)
## Now 'DF' is a data frame with a grid of the factors and the counts
## in variable 'Freq'.
DF
## Nice for taking margins ...
xtabs(Freq ~ Gender + Admit, DF)
## And for testing independence ...
summary(xtabs(Freq ~ ., DF))

## with NA's
DN <- DF; DN[cbind(6:9, c(1:2,4,1))] <- NA; DN
tools::assertError(# 'na.fail' should fail :
        xtabs(Freq ~ Gender + Admit, DN, na.action=na.fail))
xtabs(Freq ~ Gender + Admit, DN)
xtabs(Freq ~ Gender + Admit, DN, na.action = na.pass)
## The Female:Rejected combination has NA 'Freq' (and NA prints 'invisibly' as "")
xtabs(Freq ~ Gender + Admit, DN, addNA = TRUE) # ==> count NAs

## Create a nice display for the warp break data.
warpbreaks$replicate <- rep_len(1:9, 54)
ftable(xtabs(breaks ~ wool + tension + replicate, data = warpbreaks))

### __Sparse Examples ----

if(require("Matrix")) withAutoprint({
        ## similar to "nlme"s  'ergoStool' :
        d.ergo <- data.frame(Type = paste0("T", rep(1:4, 9*4)),
                             Subj = gl(9, 4, 36*4))
        xtabs(~ Type + Subj, data = d.ergo) # 4 replicates each
        set.seed(15) # a subset of cases:
        xtabs(~ Type + Subj, data = d.ergo[sample(36, 10), ], sparse = TRUE)
        
        ## Hypothetical two-level setup:
        inner <- factor(sample(letters[1:25], 100, replace = TRUE))
        inout <- factor(sample(LETTERS[1:5], 25, replace = TRUE))
        fr <- data.frame(inner = inner, outer = inout[as.integer(inner)])
        xtabs(~ inner + outer, fr, sparse = TRUE)
})
