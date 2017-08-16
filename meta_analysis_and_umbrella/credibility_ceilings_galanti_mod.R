######################
# setwd('/Users/antoniob/Documents/quickstart_projects/meta_analysis_and_umbrella/results/')
# datfile <- '../data/raw/Meg_Data_set_Gynecological.txt'
dat <- read.csv(datfile, header = TRUE, sep = '\t', stringsAsFactors = FALSE)
dim(dat)
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
# Subset for ceiling.R function (logHR, variance, cred):
cred <- 0.25
probs <- cred
# Check cases:
nrow(dat) == length(which(complete.cases(dat[, c('Study', 'yi_logHR', 'vi_logHR')]) == TRUE))

# Can't find ci.plot so modified function from:
# http://www.dhe.med.uoi.gr/images/oldsite/assets/software/ceiling.txt
# ID <- dat$Study
# means <- dat$yi_logHR
# means
# vars <- dat$vi_logHR
# vars
# prob <- 0.50

ceiling_data <- function(ID, means, vars, prob) {  
  if(length(prob) < length(means)) {
    probability <- rep(prob, length(means))
    # print(probability)
  }
  else {
    probability <- probs
    # print(probability)
  }
  rows <- length(means)
  # print(rows)
  new.var <- vars
  # print(new.var)
  for(i in 1:rows) {
    if(means[i] > 0) {
      new.var[i] <- c( - means[i]/qnorm(probability[i]))^2
      # print(means)
      # print(probability)
      # print(new.var)
    }
    else {
      new.var[i] <- c( - means[i]/qnorm(1 - probability[i]))^2
      # print(means)
      # print(probability)
      # print(new.var)
    }
  }
  new.vars <- new.var
  # print(new.vars)
  new.vars[new.var < vars] <- vars[new.var < vars]
  # print(new.vars)
  # Can't find ci.plot, presumably runs meta-analysis and generates forest plot
  # out <- ci.plot(cbind(means = means, new.vars = new.vars, rows))
  # data <- cbind.data.frame(means = means, new.vars = new.vars)
  data <- cbind.data.frame(ID = ID, means = means, new.vars = new.vars, old.vars = vars)
  data$equal_var <- data$new.vars == data$old.vars
  n_vars_inflated <- length(which(data$equal_var == FALSE))
  data_subset_inflated <- data[which(data$equal_var == FALSE), ]
  print(sprintf('Number of studies (rows) which had variances inflated: %s', n_vars_inflated))
  print('Rows marked FALSE in column old.vars had variances inflated to meet credibility ceiling')
  print(sprintf('eg row(s) %s', data_subset_inflated$ID[1]))
  # dim(data)
  # head(data)
  # tail(data)
  return(data)
  # letout <- list(data = data, out = out)
  # letout
}

# Run function to get inflated variances:
galanti_inflated <- ceiling_data(dat$Study, dat$yi_logHR, dat$vi_logHR, prob = 0.25)
dim(galanti_inflated)
head(galanti_inflated)
tail(galanti_inflated)
galanti_inflated[which(galanti_inflated$equal_var == FALSE), ]
######################

############
# 3. Re-run the meta-analyses using the inflated variances:
# TO DO: pass these results to new script
pass_data <- galanti_inflated

meta_rma <- rma(data = pass_data,
                yi = yi_logHR,
                vi = vi_logHR_inflated,
                method = "REML", # "DL"
                slab = Study,
                digits = 2)

print(meta_rma)
# forest(meta_rma)
############

############
# 4.Repeat steps 1–3 for a range of plausible credibility ceiling values.
# c_range <- seq(0, 1, 0.05)
# TO DO:

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