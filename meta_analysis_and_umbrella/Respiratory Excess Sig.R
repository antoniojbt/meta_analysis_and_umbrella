#Test for excess significance in respiratory cancer

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
dat <- read.xls(datfile, sheet="Respiratory", perl="/usr/bin/perl")
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
dat$pval <- exp((-0.717*dat$z)-(0.416*(dat$z)^2))

#is p value significant?
dat$sig_O <- dat$pval < 0.05

#tabulate the observed number of significant individual studies
table(dat$sig_O) [TRUE]

#load power package
library(pwr)

#set significance level to a=0.05
dat$a <- 0.05


#use noncentralised t test to estimate power using largest study HR
pwr_largest <- pwr.t.test(n = dat$N, d = dat$HR_Largest, sig.level = dat$a)
#save power of each study as vector largest_power
dat$largest_power <- pwr_largest$power


#use noncentralised t test to estimate power using fixed HR
pwr_fixed <- pwr.t.test(n = dat$N, d = dat$HR_Fixed, sig.level = dat$a)
#save as power of each study vector fixed_power
dat$fixed_power <- pwr_fixed$power

#use noncentralised t test to estimate power using random HR
pwr_random <- pwr.t.test(n = dat$N, d = dat$HR_Random, sig.level = dat$a)
#save power of each study as vector random_power
dat$random_power <- pwr_random$power