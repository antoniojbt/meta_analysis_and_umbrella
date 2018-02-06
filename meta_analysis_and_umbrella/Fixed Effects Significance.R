#Test for significance in Fixed Effects

#Load the 'meta' package
library(meta)
#Load the 'rmeta' package
library(rmeta)
#Load 'gdata' package
library(gdata)
#Load the 'metafor' package
library(metafor)
#Invoke help manual for metafor
library(help=metafor)
#Loading data from Excel
require(gdata)
#Link the Excel Databook at your file path

datfile = "~/Google Drive/Dissertation/Chapters/Data Extraction/Data set.xlsx"
#Call "read.xls" to read the specific Excel data sheet
dat <- read.xls(datfile, sheet="Fixed", perl="/usr/bin/perl")
#Print the data
print(dat)
View(dat)

#Effect sizes == LogHR
#Calculate log HR
dat$yi <- with(dat, log(HR))

#back transform 95% CIs to find standard error
#SE = [Log(U)-Log(HR)]/1.96
dat$sei <- ((log(dat$Upper.CI)-dat$yi)/1.96)

#calculating p values
dat$z <- (dat$yi/dat$sei)
dat$pval <- (1 - pnorm(abs(dat$z))) * 2

#is p value significant at p<0.05?
dat$sig_0.05 <- dat$pval < 0.05

#tabulate the observed number of significant individual studies
table(dat$sig_0.05) [TRUE]

#is p value significant at p<0.001?
dat$sig_0.001 <- dat$pval < 0.001

#tabulate the observed number of significant individual studies
table(dat$sig_0.001) [TRUE]

#is p value significant at p<0.001?
dat$sig_0.00001 <- dat$pval < 0.00001

#tabulate the observed number of significant individual studies
table(dat$sig_0.00001) [TRUE]