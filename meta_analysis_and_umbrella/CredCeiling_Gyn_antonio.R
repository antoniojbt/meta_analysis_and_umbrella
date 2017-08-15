######################
# Calculate credibility ceilings for umbrella reviews
# 15 August 2017
# Main reference:
# http://www.jclinepi.com/article/S0895-4356(08)00259-X/fulltext

# TO DO:
# convert to runnable script with docopt
# Input: tab separated dataframe with columns ID and HR
# Output:
# Parameters: c (credibility), range of c to test (0 to 100 with desired step)
# Requirements: library for CI plot, ceilings function (copy and place in repo)
######################


######################
# Background to method
# Methods example:
# http://www.bmj.com/content/356/bmj.j477
# "Credibility ceilings—We used credibility ceilings, a sensitivity analysis tool, 
# to account for potential methodological limitations of observational studies that might lead 
# to spurious precision of combined effect estimates.29 The main assumption of this method is 
# that every observational study has a probability c (credibility ceiling) that the true effect size is 
# in a different direction from the one suggested by the point estimate. The pooled effect size and the 
# heterogeneity between studies were re-estimated using a wide range of credibility ceiling values.2930"

# Basic criteria for evidence grading:
# http://www.bmj.com/content/356/bmj.j477
# the association survives a credibility ceiling of at least 10%.

# Results example:
# http://www.bmj.com/content/356/bmj.j477
# "A credibility ceiling of 0% corresponds to the random effects model calculation. 
# Of the 95 meta-analyses, 72 (76%) retained nominal statistical significance (P<0.05) with a 
# credibility ceiling of 5%. Fifty (53%), 33 (35%), and 19 (20%) meta-analyses remained statistically 
# significant with ceilings of 10%, 15%, and 20%, respectively. Heterogeneity between studies 
# gradually decreased with increasing ceilings. With a ceiling of 10%, no meta-analyses of cohort studies 
# with continuous exposure gave an I2 estimate larger than 50% (supplementary table 4)."
# "[...] Most meta-analyses (53%) preserved their statistical significance with a 10% credibility ceiling, 
# but only one in five preserved significance at a ceiling of 20%, 
# indicating that many associations between adiposity and cancer remain uncertain."

# Interpretation example:
# https://oup.silverchair-cdn.com/oup/backfile/Content_public/Journal/ije/40/3/10.1093/ije/dyq265/2/dyq265.pdf?Expires=1502803644&Signature=TLNFrp3F~hHR9X0RKasJMCQP2nUfLhs5aD4mm5-SbZVs7zlEP3KS1LflsPktXad4eWuQgwVMZzhTPl8-lbzWfmgbUpmeJhKyx9eU5DkCvPue9X-aHFCdGmHucMx3Z3GkGV8Kh~NL5lPHAzpnvG6ywwUYb3WmuMjDqp4YYEfbjS1RysEPZhYizeZn94mP1QrfYpxfp2x6W9HEKFzFL0sPUxcU~zKQefdcPKwq4IhGxwYJzu8UkQGc7xPOnlw08YfnQGjphyDBxTzfLm9PNgNX-HaH9xkOooLLFVW4qrF9Z0MPHAne99JKtei1GaJ4L0PbLafYwh5vg9IcjGBqALqAHA__&Key-Pair-Id=APKAIUCZBIA4LVPAVW3Q
# "[...] given  that  there are  so many biases  floating  around  in observational
# research,   what   is   the   maximum credibility  that  a  single  observational  study
# can  have   when  it  detects  an  association?’
# The  variances  of  single  studies  are  corrected so   that   the   likelihood   of   an   association
# cannot  exceed  that  posed  by  the  credibility ceiling.  The  meta-analysis  summary  effect  is
# estimated as a function of different credibility ceilings.8
# The  method  is  very  easy  to  use,  it involves  no  experts,  and  maps  the  ensuing
# meta-analysis   results   as  a  function  of   the extent   of   scepticism   for   observational   research. 
# It has the disadvantage that it penalizes exceedingly  the  more  conclusive  studies."
######################


######################
# Method explanation and base assumptions
# "Consider the synthesis of n studies. We assume that the outcome of each study i is normally distributed 
# and summarized by an effect size yi with variance vi.
# Then, assuming a random effects meta-analysis model, the study-specific likelihood
# likelihood_i(mu, theta_i, Var_i | y_i, v_i)
# where 
# i = study
# mu = common mean effect
# theta = underlying random effect 
# Var = heterogeneity variance"

# Major assumption:
# "... In a single epidemiological study, there is at least c probability that the underlying 
# effect is not in the direction of the effect suggested by the observed point estimate yi.
# Thus, it is assumed that a single study of this type can never give more than
# (1 - c) / c
# certainty that the effect is in the direction suggested by the point estimate versus not in this direction, 
# if an effect does exist.
######################

# TO DO: delete, set PATHs properly.
# setwd('/Users/antoniob/Documents/quickstart_projects/meta_analysis_and_umbrella/results/')

######################
library(meta)
# library(ggplot2)

# TO DO: check sourcing is searching PATH correctly at install
# The following is from:
# http://www.dhe.med.uoi.gr/images/oldsite/assets/software/ceiling.txt
# Inflates variance until there is "prob" to observe a result 
# on the opposite direction than the point estimate
source('../code/meta_analysis_and_umbrella/ceiling.R')
# Outputs new data, meata-analysis results after using inflated variance and forest plot
# Requires ci.plot(), unavailable, but presumably provides meta-analysis and forest plots?
######################


######################
# TO DO: switch to reading a tsv instead with standard input
# datfile = "~/Google Drive/Dissertation/Chapters/Data Extraction/Data set.xlsx"
datfile <- '../../../data/raw/Meg_Data_set_Gynecological.txt'
#Call "read.xls" to read the specific Excel data sheet
dat <- read.xls(datfile, sheet="Gynecological", perl="/usr/bin/perl")
str(dat)
head(dat)
tail(dat)
# TO DO: add some sanity check, error and stop
summary(dat)
# View(dat)
######################


######################
# Get the observed point estimates, variance, standard deviation
# Use log
# Calculate log HR
dat$yi_logHR <- log(dat$HR)
summary(dat$yi_logHR)

# Back transform 95% CIs to find standard error (yi - upper_ci) / 1.96:
dat$sei_logHR <- ((dat$yi_logHR - log(dat$Upper.CI)) / 1.96)
summary(dat$sei_logHR)

# Calculate variance for each study (variance = SE^2 * n):
dat$vi_logHR <- (dat$sei_logHR)^2 * dat$N
summary(dat$vi_logHR)

# Calculate standard deviation (SD = sqrt(vi)):
dat$SD_logHR <- sqrt(dat$vi_logHR)
summary(dat$SD_logHR)
######################


######################
# TO DO:
# Obtain credibility ceilings
# 1) For each study, calculate the probability that an observed effect with sampling variance vi
# would be on the opposite direction of the true effect.
summary(dat$yi_logHR)
summary(dat$vi_logHR)

# 1A) Generate a random number u which falls within a normal distribution based 
# on the SD and mean of the effect size for the study:
# Random variable to represent studies which replicate effect:
# u_i ~ N(y_i, v_i)
dat$ui_logHR <- rnorm(n = dat$N, mean = dat$yi_logHR, sd = dat$SD_logHR)
head(dat$ui_logHR)
tail(dat$ui_logHR)
colnames(dat)
summary(dat[, c('Study', 'ui_logHR', 'HR', 'yi_logHR')])
head(dat[, c('Study', 'ui_logHR', 'HR', 'yi_logHR')])
tail(dat[, c('Study', 'ui_logHR', 'HR', 'yi_logHR')])

hist(dat$yi_logHR)
hist(dat$HR)
hist(dat$ui_logHR)

# 1B) Get the probability that u is in the opposite direction to the estimate observed:
# No effect: for HR = 1, for log = 0
# P(u > 0 | yi < 0)
# or
# P(u < 0 | yi > 0)
# TO DO: check lower.tail settings for pnorm
dat$prob <- ifelse(dat$yi_logHR > 0,
                   pnorm(dat$ui_logHR, mean = dat$yi_logHR, sd = dat$SD_logHR, lower.tail = F),
                   pnorm(dat$ui_logHR, mean = dat$yi_logHR, sd = dat$SD_logHR, lower.tail = T)
                   )
# Convert to percentage for easier handling downstream:
dat$prob <- dat$prob * 100
summary(dat$prob)

# 2A) Set a predefined credibility ceiling c (%) (arbitrary but should be justified):
# TO DO: for scripting, set this as parameter
cred <- 50

# 2B) Is the probability of u being in the opposite direction to yi less than c?
dat$probu_less_than_cred <- dat$prob < cred
dat$probu_less_than_cred
summary(dat$probu_less_than_cred)

# If yes recalculate the variance (originally vi = (yi / Z_c) ^ 2) and inflate as:
# v_i = max{(y_i / / Z_c)}
# with z being the inverse of the cumulative normal distribution.
# qnorm() provides this
# or use ceiling.R function sourced above for this step

dat$vi_logHR_inflated <- ifelse(dat$probu_less_than_cred == TRUE,
                                (dat$yi_logHR / qnorm(dat$prob))^2,
                                NA)

# 3. Re-run the meta-analyses using the inflated variances:

# 4.Repeat steps 1–3 for a range of plausible credibility ceiling values.
c_range <- seq(0, 100, 5)

######################