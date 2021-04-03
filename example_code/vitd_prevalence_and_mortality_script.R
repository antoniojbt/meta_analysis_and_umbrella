getwd()
#set working directory
setwd("C:/Users/INSPIRON/Documents/Rch")
# load required packages
library(meta)
library(metafor)
#
# PREVALENCE
#
# Prevalence of vitamin D deficiency from thw whole dataset of studies (n = 51)
prev1 <-read.csv("p1.rda", as.is=TRUE)
prev1
View(prev1)
# meta-analysis of proportions to pool studies together:
metaprop(vddch, totch, studlab=(study), data=prev1)
# give it a name using "meta"
metaprev1 <- metaprop(vddch, totch, studlab=(study), data=prev1)
#
# obtain forest plot (random effects)
forest(metaprev1, comb.fixed=FALSE, xlab= "proportion")
# obtain funnel plot
funnel(metaprev1, comb.fixed=FALSE, xlab = "Logit Transformed Proportion")
# obtain forest plot (fixed effects)
forest(metaprev1, comb.random=FALSE, xlab = "proportion")
#
# Egger's test linear regression
metabias(metaprev1, method="linreg")
#
# Above steps repeated for: 
#
# Prevalence of vdd in cohort studies only:
#
coh <-read.csv("cohort.rda", as.is=TRUE)
coh
View(coh)
metaprop(vddch, totch, studlab=(study), data=coh)
metac <-metaprop(vddch, totch, studlab=(study), data=coh)
metac
metabias(metac)
funnel(metac, comb.fixed=FALSE, xlab = "Logit Transformed Proportion")
forest(metac, comb.fixed=FALSE, xlab="Logit Transformed Proportion")
# Prevalence of vdd in case-control studies only 
#
caseco <-read.csv("casecontrol.rda", as.is=TRUE)
caseco
metaprop(vddch, totch, studlab=(study), data=caseco)
metacaseco <-metaprop(vddch, totch, studlab=(study), data=caseco)
metacaseco
funnel(metacaseco, comb.fixed=FALSE, xlab = "Logit Transformed Proportion")
forest(metacaseco, comb.fixed=FALSE, xlab="Logit Transformed Proportion")
metabias(metacaseco)
#
# Prevalence of vdd in cross-sectional studies
crossec <-read.csv("crossectional.rda", as.is=TRUE)
crossec
View(crossec)
metaprop(vddch, totch, studlab=(study), data=crossec)
metacrossec <-metaprop(vddch, totch, studlab=(study), data=crossec)
funnel(metacrossec, comb.fixed=FALSE, xlab = "Logit Transformed Proportion")
forest(metacrossec, comb.fixed=FALSE, xlab="Logit Transformed Proportion")
metabias(metacrossec)
#
# Prevalence of vdd in cross sectional and case-control together
cccs <-read.csv("casecandcrossec.rda", as.is=TRUE)
cccs
View(cccs)
metaprop(vddch, totch, studlab=(study), data=cccs)
metacccs <- metaprop(vddch, totch, studlab=(study), data=cccs)
metabias(metacccs)
forest(metacccs, comb.fixed=FALSE, xlab="Logit Transformed Proportion")
#
# Prevalence of vdd in studies with small sampler size 
smallsa <-read.csv("smalls.rda", as.is=TRUE)
smallsa
View(smallsa)
metaprop(vddch, totch, studlab=(study), data=smallsa)
metasmall <- metaprop(vddch, totch, studlab=(study), data=smallsa)
metabias(metasmall)
forest(metasmall, comb.fixed=FALSE, xlab="Logit Transformed Proportion")
funnel(metasmall, comb.fixed=FALSE, xlab = "Logit Transformed Proportion")
#
# Prevalence of vdd in studies of larger sample size 
largesa <-read.csv("larges.rda", as.is=TRUE)
largesa
metaprop(vddch, totch, studlab=(study), data=largesa)
metalarge <- metaprop(vddch, totch, studlab=(study), data=largesa)
forest(metalarge, comb.fixed=FALSE, xlab="Logit Transformed Proportion")
#
# Prevalence of vdd in studies from India only 
#
ind <-read.csv("india.rda", as.is=TRUE)
ind
metaprop(vddch, totch, studlab=(study), data=ind)
metaind <- metaprop(vddch, totch, studlab=(study), data=ind)
forest(metaind, comb.fixed=FALSE, xlab="Logit Transformed Proportion")
metabias(metaind, method="linreg")
#
# Prevalence of vdd in studies from Turkey only 
turk <-read.csv("turkey.rda", as.is=TRUE)
turk
metaprop(vddch, totch, studlab=(study), data=turk)
metaturk <-metaprop(vddch, totch, studlab=(study), data=turk)
forest(metaturk, comb.fixed=FALSE, xlab="Logit Transformed Proportion")
# Prevalence in those studies using <= 50 nmol as threshold for vd levels 
thresh <- read.csv("thresh.rda", as.is=TRUE)
View(thresh)
metaprop(vddch, totch, studlab=(study), data=thresh)
thld <- metaprop(vddch, totch, studlab=(study), data=thresh)
metathld <- metaprop(vddch, totch, studlab=(study), data=thresh)
forest(metathld, comb.fixed=FALSE, xlab="Logit Transformed Proportion")
#
# Prevalence in studies with a respiratory condition as outcome (pneumonia, broncholitis, ALRTI)
thresh <- read.csv("thresh.rda", as.is=TRUE)
View(thresh)
metaprop(vddch, totch, studlab=(study), data=thresh)
thld <- metaprop(vddch, totch, studlab=(study), data=thresh)
metathld <- metaprop(vddch, totch, studlab=(study), data=thresh)
forest(metathld, comb.fixed=FALSE, xlab="Logit Transformed Proportion")
#
#
#  SEPSIS 
#
#
prevs <- read.csv("sepsisp.rda", as.is = TRUE)
View(prevs)
metaprop(vddseps, totseps, studlab=(study), data=prevs)
metas <- metaprop(vddseps, totseps, studlab=(study), data=prevs)
metas
forest(metas, comb.fixed=FALSE, xlab = "Logit Tranformed Proportion")
forest(metas, comb.random=FALSE, xlab = "Logit Tranformed Proportion")
funnel(metas, comb.fixed=FALSE, xlab = "Logit Tranformed Proportion")
metabias(metas, method="linreg")
#
# Prevalence of vdd in those studies using <= 50 nmol as threshold for vit d levels in septic individuals
prevs2 <- read.csv("sepsisp2.rda", as.is = TRUE)
View(prevs2)
metaprop(vddseps, totseps, studlab=(study), data=prevs2)
metas2 <- metaprop(vddseps, totseps, studlab=(study), data=prevs)
metas2
forest(metas2, comb.fixed=FALSE, xlab = "Logit Tranformed Proportion")
forest(metas2, comb.random=FALSE, xlab = "Logit Tranformed Proportion")
funnel(metas2, comb.fixed=FALSE, xlab = "Logit Tranformed Proportion")
#
# above steps repeated for: cohort, case-control & cross sectional studies, studies of smaller sample size.
# studies of larger sample size, studies in India, studies in Turkey 
#
#  MORTALITY 
#
# Mortality risk vitamin D deficient versus vitamin D not deficient critically ill children
#
mortall <- read.csv("mortalityall.rda", as.is=TRUE)
mort1 <- read.csv("mortality1.rda", as.is = TRUE)
mort1
View(mort1)
metabin(deaddef, alldef, deadnotdef, allnotdef, sm= "OR", method="I", data=mort1, studlab=study)
metamo <-metabin(deaddef, alldef, deadnotdef, allnotdef, sm= "OR", method="I", data=mort1, studlab=study)
metamo
forest(metamo, comb.fixed=FALSE, xlab = "Odds ratio")
forest(metamo, comb.random=FALSE, xlab = "Odds ratio")
funnel(metamo, comb.fixed=FALSE, xlab = "Logit Tranformed Odds Ratio")
# Eggers test:
metabias(metamo, method="linreg")
#
#
# MORTALITY risk with only those studies vd levels <= 50 nmol/L (equivalent to 20 ng/ml)
mthresh <- read.csv("mortalthresh.rda", as.is=TRUE)
mthresh
View(mthresh)
metabin(deaddef, alldef, deadnotdef, allnotdef, sm= "OR", method="I", data=mthresh, studlab=study)
metathresh <-metabin(deaddef, alldef, deadnotdef, allnotdef, sm= "OR", method="I", data=mthresh, studlab=study)
metathresh
forest(metathresh, comb.fixed=FALSE, xlab = "Odds ratio")
# Eggers test:
metabias(metathresh, method="linreg")
#
# Risk of death (vitamin D deficient versus not deficient) in cohort studies only
mcoh <- read.csv("mortcohort.rda", as.is=TRUE)
View(mcoh)
metabin(deaddef, alldef, deadnotdef, allnotdef, sm= "OR", method="I", data=mcoh, studlab=study)
metacoh <-metabin(deaddef, alldef, deadnotdef, allnotdef, sm= "OR", method="I", data=mcoh, studlab=study)
metacoh
metabias(metacoh, method="linreg")
funnel(metacoh)
forest(metacoh, comb.fixed=FALSE, xlab = "Odds ratio")
#
# Mortality risk in: case-control and cross sectional studies combined
mcasecross <- read.csv("mortcasecross.rda", as.is=TRUE)
mcasecross
View(mcasecross)
metabin(deaddef, alldef, deadnotdef, allnotdef, sm= "OR", method="I", data=mcasecross, studlab=study, comb.fixed=FALSE)
metabin(deaddef, alldef, deadnotdef, allnotdef, sm= "OR", method="I", data=mcasecross, studlab=study, comb.random=FALSE)
metacr <- metabin(deaddef, alldef, deadnotdef, allnotdef, sm= "OR", method="I", data=mcasecross, studlab=study, comb.fixed=FALSE)
forest(metacr, comb.fixed=FALSE, xlab = "Odds ratio")
#
# Mortality risk in studies from India
mortind <- read.csv("mortalityindia.rda", as.is=TRUE)
mortind
View(mprtind)
metabin(deaddef, alldef, deadnotdef, allnotdef, sm= "OR", method="I", data=mortind, studlab=study, comb.fixed=FALSE)
metabin(deaddef, alldef, deadnotdef, allnotdef, sm= "OR", method="I", data=mortind, studlab=study, comb.random=FALSE)
#
# random effects: 
metaindia <- metabin(deaddef, alldef, deadnotdef, allnotdef, sm= "OR", method="I", data=mortind, studlab=study, comb.fixed=FALSE)
forest(metaindia, comb.fixed=FALSE, xlab = "Odds ratio")
#
# FOR PLOTS
#
setwd("C:/Users/INSPIRON/Documents/forplots")
getwd()
prevs <- read.csv("prev_sepsis.rda", as.is = TRUE)
View(prevs)
metaprop(vddseps, totseps, studlab=(study), data=prevs)
metasepsis <- metaprop(vddseps, totseps, studlab=(study), data=prevs)
forest(metasepsis, comb.fixed=FALSE, xlab = "Logit Tranformed Proportion")
forest(metasepsis, comb.random=FALSE, xlab = "Logit Tranformed Proportion")
funnel(metasepsis, comb.fixed=FALSE, xlab = "Logit Tranformed Proportion")
#
# mortality main (generate basic plots)
mortality_all <- read.csv("mortality.rda", as.is = TRUE)
View(mortality_all)
metabin(deaddef, alldef, deadnotdef, allnotdef, sm= "OR", method="I", data=mortality_all, studlab=study)
metam <- metabin(deaddef, alldef, deadnotdef, allnotdef, sm= "OR", method="I", data=mortality_all, studlab=study)
forest(metam, comb.fixed=FALSE, xlab = "Odds ratio")
forest(metam, comb.random=FALSE, xlab = "Odds ratio")
funnel(metam, comb.fixed=FALSE, xlab = "Logit Tranformed Odds Ratio")
#
# neonates (with 6 studies)
nen <- read.csv("neonates.rda", as.is = TRUE)
View(nen)
metaprop(vddch, totch, studlab=(study), data=nen)


*uses default: Clopper-Pearson (for confidence interval calculation) and PLOGIT for transformations of proportions

