######################
# Georgia Salanti 12 March 07
# Copied from:
# http://www.dhe.med.uoi.gr/images/oldsite/assets/software/ceiling.txt
# Inflate confidence intervals for meta-analysis
# Input vectors of means, variances and probabilities of length equal to the 
# number of studies included in meta-analysis
# The variance will be inflated to leave a prob% chance to observe a result 
# on the opposite direction than the point estimate
# If the 'prob' argument is a single number, it is repeated for all studies
# Result: a list with [1] the new data [2] the output of the meta-analysis
# and a forest plot is created
# Needs the subroutine ci.plot to be downloaded from #http://citeseer.ist.psu.edu/29387.html
######################


######################
ceiling_data <- function(means, vars, prob) {  
  if(length(prob) < length(means)) {
    probability <- rep(prob, length(means))
  }
  else {
    probability <- probs
  }
  rows <- length(means)
  new.var <- vars
  for(i in 1:rows) {
    if(means[i] > 0) {
      new.var[i] <- c( - means[i]/qnorm(probability[i]))^2
    }
    else {
      new.var[i] <- c( - means[i]/qnorm(1 - probability[i]))^2
    }
  }
  new.vars <- new.var
  new.vars[new.var < vars] <- vars[new.var < vars]
  out <- ci.plot(cbind(means = means, new.vars = new.vars, rows))
  data <- cbind.data.frame(means = means, new.vars = new.vars)
  letout <- list(data = data, out = out)
  letout
}
######################