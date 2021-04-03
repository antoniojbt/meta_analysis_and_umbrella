#Test for excess significance in Mutliple sites

require(gdata)
#Link the Excel Databook at your file path

datfile = "~/Google Drive/Dissertation/Chapters/Data Extraction/Data set.xlsx"
#Call "read.xls" to read the specific Excel data sheet
dat <- read.xls(datfile, sheet="Gastrointestinal", perl="/usr/bin/perl")
#Print the data
print(dat)
View(dat)

#Effect sizes == LogHR
#Calculate log HR
dat$yi <- with(dat, log(HR))

#back transform 95% CIs to find standard error
#SE = [Log(U)-Log(HR)]/1.96
#SE = (Log(U)-Log(L))/(2*1.96)
dat$sei <- ((log(dat$Upper.CI)- log(dat$Low.CI))/(2*1.96))

#calculating p values
#http://www.bmj.com/content/343/bmj.d2304
dat$z <- (dat$yi/dat$sei)

#z value cannot be a negative for the calculation of pval
dat$z <- abs(dat$z)
dat$pval <- exp((-0.717*dat$z)-(0.416*((dat$z)^2)))

#is p value significant?
dat$sig_O <- dat$pval < 0.05

#checking alternative calculation
dat$pval2 <- (1 - pnorm(abs(dat$z))) * 2

#is p value significant?
dat$sig_A <- dat$pval2 < 0.05

#tabulate the observed number of significant individual studies
table(dat$sig_O) [TRUE]

table(dat$sig_A) [TRUE]

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


