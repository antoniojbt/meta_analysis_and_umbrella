#############################################
# xxx.R - for xxx

# Author: 
# Date: 

#Purpose
#=======


#Methods
#=======


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


# Input
# Output

# Use docopt, see
#https://github.com/AntonioJBT/various.dir/blob/master/Notes-common-cmds/docopt_argument_parser.txt
#https://github.com/docopt/docopt.R

#############################################


#############################################
# Logging
# TO DO: move to a separate script

##Set working directory and file locations and names of required inputs:

# Working directory:
setwd('/Users/antoniob/Documents/')

#Direct output to file as well as printing to screen (plots aren't redirected though, each done separately). 
#Input is not echoed to the output file either.

output_file <- file(paste("R_session_output_",Sys.Date(),".txt", sep=""))
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
R_session_saved_image <- paste('R_session_saved_image_','.RData', sep='')
R_session_saved_image

# Run with cmd arguments:
args <- commandArgs(trailingOnly = TRUE)
#############################################

#############################
# Import libraries:
library(ggplot2)
library(data.table)
library(gridExtra)
#############################


#############################################
# Set-up arguments:

xxx_var = as.character(args[1])
#############################################



#############################################
# Read files:
xxx_file <- fread(snpspos, sep = ' ', header = TRUE, stringsAsFactors = FALSE)
head()
dim()
#############################################
# What about detecting publication bias?
# Which one is more appropriate in our case?
# Detection of biases
# Egger’s linear regression method
# Begg and Mazumdar’s rank correlation method 
# The Duval and Tweedie’s trim and fill method, on meta-analysis of continuous data.

# *Begg and Mazumdar test: rank correlation test
# This test is based on the correlation between a standardized treatment effect and within trial variance. 
# The null hypotehsis of NO bias is rejected at the significance level alpha. Instead of conducting a statistical test, the Kendall's tau with (1 - a) 
# confidence interval can be reported in a systematic review. It has been shown that the power of Begg and Mazumdar test is poor. 
# Use the metabias functgion of the R package meta like this:
# example: >metabias(ms1, method="rank")
# Alternative hypothesis: asymmetry in funnel plot. So if p-value is LESS than the predefined alpha value (e.g. 0.05) then we will reject 
# the null hypothesis so the conclusion in such a case will be: 
# Rejecting the null hypothesis (of symmetry in the funnel plot) and and accepting the alternative hypothesis that indicates marked asymmetry 
# of the funnel plot.


# *Egger's test: Linear regression test
# This was proposed by Egger et al [Paper Citation: Egger, M., Davey Smith, G., Schneider, M., & Minder, C. (1997). 
# Bias in meta-analysis detected by a simple, graphical test. BMJ: British Medical Journal, 315(7109), 629–634.]
# This test is based in a simple linear regression 
# The appeoach is justified by the intuitive argument that in the presence of publication bias small studies with non-significant or negative results 
# are less likely to be published. 
# Null-hypothesis: no bias in a meta-analysis 
# Assumption of test: Linearity still holds in the presence of bias
# Again for this test use the metabias functgion of the R package meta like this:
# example: >metabias (ms1, method="linreg")

# A Comparison of Methods to Detect Publication Bias for Meta-analysis of Continuous Data
# try it
# mortal <- read.csv("mortcorrect.rda", as.is=TRUE)
# mortal
# View(mortal)
metabin(deaddef, alldef, deadnotdef, allnotdef, studlab=study, data=mortal, method="Inverse", sm= "OR")
# now do the eggers test
mort1 <- metabin(deaddef, alldef, deadnotdef, allnotdef, studlab=study, data=mortal, method="Inverse", sm= "OR")
metabias(mort1, method="linreg")

# RESULTS
# e.g.: so in this case Eggers test shows a significant p-value (0.0035) which is less than 0.05 
# and thus this leads to rejecting the null hypothesis, of symmetry in the funnel plot.
 


#############################################
# Plot:
png(paste('qqplot_', SNP_file, '.png', sep = ''))
plot(me)
dev.off()
#############################################


#############################################
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
