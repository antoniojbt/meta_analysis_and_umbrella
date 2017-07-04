# Notes and commands for meta-analysis for VD in acute and critical care

# 11/July/2016

# file with prevalence data:
# /ifs/home/antoniob/Documents/Sepsis/Meta/Prevalence.txt

# We obtained raw proportions and sample sizes (cases) from each paper. 

# Calculated the confidence intervals in Stata 12 
# using the command " cii 'sample size' 'observed cases', binomial wilson "

# I then used the R package metafor to transform the proportions using the Freeman Turkey method 
# (arcsin).

# Metafor website and documentation:
# http://www.metafor-project.org/doku.html
# and publication:
# http://www.jstatsoft.org/v36/i03/

# Also see:
# https://cran.r-project.org/web/views/MetaAnalysis.html
# https://cran.r-project.org/web/packages/metagear/index.html


#####################
# Commands:

# Load library for meta-analysis:
library("metafor")
#####################


#####################
# Create variable to read table from file:
t <- read.table("Prevalence.txt", header=T) 
#####################

#####################
#Run Freeman Turkey transformation ("PFT") using metafor's escalc function:
FTtrans <- escalc(measure="PFT", ni = Sample_size_cases, xi = Cases_observations, data = t, append = T)

#Create variable to run the rma function. Here I've specified a random effects model
# ("DL" for Dersimonian-Laird estimator):
resDL <- rma(yi, vi, data = FTtrans, method = "DL", measure = "PFT")

#For fixed effects model, run:
resFE <- rma(yi, vi, data = FTtrans, method = "FE", measure = "PFT")

#To obtain confidence intervals of the output of the model (CIs from residuals of heterogeneity):
confint(resDL)
#or (same results as confint(resDL)):
confint.rma.uni(resDL)

#To print results to screen:
print.rma.uni(resDL)
#or
summary.rma.uni(resDL)

#To capture output of text results from above:
#out <- capture.output(res, confint(res), forest(res))
#To print to file:
#cat(out,file="out.txt",sep="\n",append=TRUE)

#To check which studies have more influence use:
influence.rma.uni(resDL)

#To run a forest plot of the model results:
forest(res)

#To obtain funnel plot to look at publication bias:
funnel.rma(resDL)

#To test for publication bias(ie funnel plot asymmetry):
ranktest.rma(resDL)
regtest.rma(resDL)

#To save plots:
#Choose format and filename:
png('xxxx.png')
#Create plot (you won't see it):
funnel.rma(resDL)
#Close saving plot session. file will be saved in the current working directory:
dev.off()




##I need to:

#	Save to file
#	test different models (fixed effects, mixed effects, random effects models with other estimators of heterogeneity than DL). Peto and Mantel-Haenszel methods aren't appropriate for prevalence.

#	Back-transform effect size estimate and CI from the meta-analysis to interpret result, check these methods:

invres <- transf.ipft.hm(0.0930, targs=list(res$tau2, lower=0.0611, upper=0.2156))

transf.ipft.hm(xi=c(0.0930), targs=list(res$tau2, lower=0.0611, upper=0.2156))


