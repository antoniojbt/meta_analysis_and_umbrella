#############################################
# xxx.R - for xxx

# Author: 
# Date: 

#Purpose
#=======


#Methods
#=======
# We obtained raw proportions and sample sizes (cases) from each paper. 
# Calculated the confidence intervals binomial wilson
# Transform the proportions using the Freeman Turkey method (arcsin).

# TO DO:
#	test different models (fixed effects, mixed effects, random effects models with other estimators of heterogeneity than DL). 
# Peto and Mantel-Haenszel methods aren't appropriate for prevalence.


#Usage
#=====

#To use type::
#    xxx.R [options] [arguments]
#    xxx.R --help

#Options
#=======

#-I    input file name.
#-S    output file name.
#-L    log file name.


# Input:
# The input file must be tab separated with the columns: TO DO


# Output:
# TO DO:
# Plots xxxx, yyy and table zzzz

# Use docopt, see
#https://github.com/AntonioJBT/various.dir/blob/master/Notes-common-cmds/docopt_argument_parser.txt
#https://github.com/docopt/docopt.R
#############################################


#############################################
# Logging
# TO DO: move to a separate script

##Set working directory and file locations and names of required inputs:

# Working directory:
# setwd('/Users/antoniob/Documents/')

#Direct output to file as well as printing to screen (plots aren't redirected though, each done separately). 
#Input is not echoed to the output file either.

output_file <- file(paste("R_session_output_prevalence",Sys.Date(),".txt", sep=""))
output_file
sink(output_file, append=TRUE, split=TRUE, type = c("output", "message"))

#If the script can run from end to end, use source() with echo to execute and save all input 
#to the output file (and not truncate 150+ character lines):
#source(script_file, echo=TRUE, max.deparse.length=10000)

#Record start of session and locations:
Sys.time()
print(paste('Working directory :', getwd()))
getwd()

##TO DO extract parameters:

# Re-load a previous R session, data and objects:
#load('R_session_saved_image_order_and_match.RData', verbose=T)

# Filename to save current R session, data and objects at the end:
R_session_saved_image <- paste('R_session_saved_image_prevalence','.RData', sep='')
R_session_saved_image

# Run with cmd arguments:
args <- commandArgs(trailingOnly = TRUE)
#############################################


#############################################
# Import libraries:
library(ggplot2)
library(gridExtra)

library('meta')
library("metafor")
# Metafor website and documentation:
# http://www.metafor-project.org/doku.html
# and publication:
# http://www.jstatsoft.org/v36/i03/

# Also see:
# https://cran.r-project.org/web/views/MetaAnalysis.html
# https://cran.r-project.org/web/packages/metagear/index.html
#############################################


#############################################
# Set-up arguments:
prevalence_file <- as.character(args[1])
#############################################



#############################################
# Read files:
prevalence_file <- read.csv(prevalence_file, sep = '\t', header = TRUE, stringsAsFactors = FALSE)
head(prevalence_file)
tail(prevalence_file)
dim(prevalence_file)
str(prevalence_file)
class(prevalence_file)
#############################################


#############################################
# Run Freeman Turkey transformation ("PFT") using metafor's escalc function:
FTtrans <- escalc(measure="PFT", ni = Sample_size_cases, xi = Cases_observations, data = t, append = T)
FTtrans

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



#####################
#	Back-transform effect size estimate and CI from the meta-analysis to interpret result, check these methods:

invres <- transf.ipft.hm(0.0930, targs=list(res$tau2, lower=0.0611, upper=0.2156))

transf.ipft.hm(xi=c(0.0930), targs=list(res$tau2, lower=0.0611, upper=0.2156))
#####################



#####################
# MAIN ANALYSES

# PREVALENCE
prevalencedata <- read.csv("prevalence.rda", as.is=TRUE)

#type: prevalencedata to view the data
prevalencedata

mprev1 <- metaprop(vddch, totch, studlab=paste(study), data = prevalencedata)
mprev1

# Forest plot, fixed effects:
forest(mprev1, comb.fixed=FALSE, xlab= "proportion")
# The above for the random effects model:
forest(mprev1, comb.random=FALSE, xlab= "proportion")
#Q: should x axes be labelled as "proportion" or "prevalence 95% CI") ???

# Funnel plot:
funnel(mprev1)

# TO DO:
# Can try using addtau2=TRUE to add between-study error.
# Also can try: funnel(trimfill(result.rd))
# TRY: prev_arc <- metaprop(vddch, totch, studlab=paste(study), data = prevalencedata, sm = "PAS")
# TRY: prev_logit <- metaprop(vddch, totch, studlab=paste(study), data = prevalencedata, sm = "PLOGIT")
# prev_arc
# str(prev_arc)
# head(prev_arc)
# prev_arc$event
# prev_arc$n
# prev_arc$method.ci
# summary(prev_arc)
# summary(prev_logit)


# MORTALITY
# open file: mortaldata.rda
mortality <- read.csv("mortaldata.rda", as.is=TRUE)
mortality

# check the above cz random&fixed give same results
metamortal <- metabin(Eedeaddef, Nealldef, Ecdeadnodef, Ncallnondef, sm= "OR", method="I", data=mortality, studlab=study)
metamortal

forest(metamortal, comb.fixed=FALSE, xlab= "odds ratio")
# why xlab= proportion in the other analysis? clarify

# same to get fixed effect model result:
forest(metamortal, comb.random=FALSE, xlab= "odds ratio")

# get funnel plot
funnel(metamortal)


# the above two ("PAS" vs "PLOGIT" give different results which one to use? default for proportions no?
# sm: A character string indicating which summary measure ("PFT", "PAS", "PRAW", "PLN", or "PLOGIT") 
# is to be used for pooling of studies, see Details.



# Funnel plot (for mortality)
funnel(meta2, sm= "OR", comb.fixed =TRUE, level=0.95)
funnel(meta2$TE, meta2$seTE, sm= "OR", comb.fixed =TRUE, level=0.95)

# Radial plot -maybe this not needed 
# Radial or Galbraith plot it is the alternative of the forest plot [logOR] 
# Horizontal axis: 1/standard error
# Vertical axis: effect divided by standard error 
radial(meta2, level=0.95)


# use: metabias to test for funnel plot asymmetry for mortality outcome!
?metabias
# rank correlation test of funnel plot asymmetry: 
metabias(meta2, method.bias = "rank")
# So if alpha 0.05 is used as the cut-off for significance, then here 0.01 is < 0.05 so the null hypothesis is rejected and alternative 
# is accepted i.e. that funnel plot is asymmetric.

# Rank correlation test of funnel plot asymmetry (with continuity correction)
metabias(meta2, method.bias="rank", correct=TRUE)
# The xlab option is used to label the x-axis: e.g. xlab= "xxxxxxxx units xxxx" 
# xlim=c( X, Y) used to specifiy limits of the x-axis e.g. xlim=c(-50, 10) means that limits are between -50 and 10
#####################





#############################################
# Plot:
png(paste('qqplot_', SNP_file, '.png', sep = ''))
plot(me)
dev.off()


## Save some text:
cat(file = 'xxx.txt', xxx_var, "\t", xxx_var, '\n', append = TRUE)
#############################################


#############################################
# The end:
# Remove objects that are not necessary to save:
# ls()
# object_sizes <- sapply(ls(), function(x) object.size(get(x)))
# as.matrix(rev(sort(object_sizes))[1:10])
#rm(list=ls(xxx))
#objects_to_save <- (c('xxx_var'))
#save(list=objects_to_save, file=R_session_saved_image, compress='gzip')

# To save R workspace with all objects to use at a later time:
save.image(file=R_session_saved_image, compress='gzip')

sessionInfo()
q()

# Next: run the script for xxx
#############################