######################
# Custom steps to obtain without function above and generating a random variable first.
# Obtain credibility ceilings
###########
# 1) For each study, calculate the probability that an observed effect with sampling variance vi
# would be on the opposite direction of the true effect.
summary(dat$yi_logHR)
summary(dat$vi_logHR)

# TO DO: handle NAs, currently assume complete cases
# TO DO: Stop if not true
length(complete.cases(dat$yi_logHR)) == nrow(dat)

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
###########

###########
# 1B) Get the probability that u is in the opposite direction to the estimate observed
# Use mean and SD from point estimate? Else will be 0 an 1, with log this should be appropriate
# No effect: for HR = 1, for log = 0
# P(u < 0 | yi > 0)
# or
# P(u > 0 | yi < 0)
# TO DO: continue here, check lower.tail settings for pnorm, this is the inverse of the cum. dist.
# One case (row), yi > 0:
index_greater <- which(dat$yi_logHR > 0)[1]
dat$ui_logHR[index_greater]
dat$yi_logHR[index_greater]
dat$SD_logHR[index_greater] # TO DO: large SD, is this correct? Double check...
pnorm(dat$ui_logHR[index_greater], lower.tail = F)#, mean = dat$yi_logHR[index], sd = dat$SD_logHR[index])
# One case (row), yi < 0:
index_lower <- which(dat$yi_logHR < 0)[1]
pnorm(dat$ui_logHR[index_lower], lower.tail = T)#, mean = dat$yi_logHR[index], sd = dat$SD_logHR[index])
# All cases:
dat$prob <- ifelse(dat$yi_logHR > 0,
                   pnorm(dat$ui_logHR, lower.tail = F), #mean = dat$yi_logHR, sd = dat$SD_logHR)
                   pnorm(dat$ui_logHR, lower.tail = T) #mean = dat$yi_logHR, sd = dat$SD_logHR)
)
# TO DO: sanity, stop if less than zero or more than 1, other?
dat$prob

# Explore values, check distributions, as expected?
summary(dat$prob)
hist(dat$prob)
head(dat[which(dat$prob > 0.50), ])#c('Study', 'ui_logHR', 'HR', 'yi_logHR')]
# View(dat[which(dat$prob > 0.50), ])
###########

###########
# 2A) Set a predefined credibility ceiling c (%) (arbitrary but should be justified):
# Use values from 0 to 1 only.
# 0% corresponds to random effects model, 
# 10% arbitrary cut-off for grading evidence
# 25% as arbitrary rule of thumb minimal, higher is better
# Lower c, higher certainty that the effect observed is towards the true effect (direction at least)
cred <- 0.25
# Interpretation, from main ref:
# It is assumed that a single study of this type can never give more than
(1 - cred) / cred
# times the certainty that the effect is in the direction suggested by the point estimate versus not in this direction,
# if an effect does exist.
###########

###########
# 2B) Is the probability of u being in the opposite direction to yi less than c?
dat$probu_less_than_cred <- dat$prob < cred
dat$probu_less_than_cred
summary(dat$probu_less_than_cred)

# TO DO: check setting for mean and sd for qnorm, default is 0 and 1
# If yes recalculate the variance (vi = (yi / Z_c) ^ 2) and inflate according to c value
# with z being the inverse of the cumulative normal distribution.

dat$vi_logHR_inflated <- ifelse(dat$probu_less_than_cred == TRUE,
                                (dat$yi_logHR / qnorm(cred))^2,
                                dat$vi_logHR
                                )
dat$vi_logHR_inflated
summary(dat$vi_logHR_inflated)
hist(dat$vi_logHR_inflated)
dat$equal_var <- dat$vi_logHR_inflated == dat$vi_logHR
summary(dat$equal_var) # new variance is the same as the old one, i.e. prob of u is higher than c
summary(dat$probu_less_than_cred) # Sanity, inverted results should be the same

# Sanity, old and new variances should be the same:
summary(dat[which(dat$equal_var == TRUE), c('Study', 'vi_logHR', 'vi_logHR_inflated')])
# Differences in variances:
summary(dat[which(dat$equal_var == FALSE), c('Study', 'vi_logHR', 'vi_logHR_inflated')])
###########

###########
# Compare Galanti function and this:
galanti_inflated[which(galanti_inflated$equal_var == FALSE), ]
dim(galanti_inflated[which(galanti_inflated$equal_var == FALSE), ])
head(dat[which(dat$equal_var == FALSE), ])
dim(dat[which(dat$equal_var == FALSE), ])
# TO DO: Not the same...
############

############
# 3. Re-run the meta-analyses using the inflated variances:
# TO DO: pass these results to new script, else use the ceilings.R script
pass_data <- galanti_inflated

meta_rma <- rma(data = pass_data,
                yi = yi_logHR,
                vi = vi_logHR_inflated,
                method = "REML", # "DL"
                slab = dat_inflate$Study,
                digits = 2)

print(meta_rma)
# forest(meta_rma)
############

############
# 4.Repeat steps 1–3 for a range of plausible credibility ceiling values.
# c_range <- seq(0, 1, 0.05)
# TO DO:
# 
c_min <- as.integer(opt $ `-c_min`)
c_max <- as.integer(opt $ `-c_max`)
c_step <- as.integer(opt $ `-c_step`)
c_range <- seq(c_min, c_max, c_step)
############
######################


#############################################
# Plot:
# svg(paste('qqplot_', SNP_file, '.svg', sep = ''))
# plot()
# dev.off()
#############################################


#############################################
## Save some text:
# cat(file = 'xxx.txt', xxx_var, "\t", xxx_var, '\n', append = TRUE)
#############################################


#############################################
## Save a dataframe:
# 
#############################################


#############################################
# The end:
sessionInfo()
q()

# Next: run the script for xxx
#############################
