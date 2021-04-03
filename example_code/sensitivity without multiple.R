##Aggregated meta-analysis
##Random Effects

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
dat <- read.xls(datfile, sheet="WOMulti", perl="/usr/bin/perl")
#Print the data
print(dat)
View(dat)

#Effect sizes == LogHR
#Calculate log HR
dat$yi <- with(dat, log(HR))

#back transform 95% CIs to find standard error
#SE = [Log(U)-Log(HR)]/1.96
dat$sei <- ((log(dat$Upper.CI)-dat$yi)/1.96)


#Use generic inverse variance meta-analysis to calculate pooled HR from
#log(HR) and standard error
## inverse variance weighting is used for pooling results
Site <- metagen(TE = dat$yi, seTE = dat$sei, data = NULL, studlab = dat$Author, 
                subset = (dat$Biomarker == "NLR"), 
                sm ="HR",  byvar = dat$Site,
                prediction = TRUE, comb.random = TRUE)

forest.meta(Site, 
            studlab = TRUE,  
            comb.random = Site$comb.random, 
            comb.fixed = Site$comb.fixed,
            text.random = "Pooled HR by Random Effects",
            text.fixed = "Pooled HR by Fixed Effects", 
            print.subgroup.labels = TRUE,
            lyt.random = TRUE, 
            lyt.fixed = TRUE, 
            type.study="square", 
            type.fixed="diamond", 
            type.random="diamond", 
            col.study="black", 
            col.square="lightskyblue3", 
            col.inside="white", 
            col.diamond="lightskyblue3", 
            col.diamond.lines="dodgerblue4", 
            col.predict="dodgerblue4", 
            col.predict.lines="dodgerblue4", 
            col.by="dodgerblue4", 
            col.label.right="black",
            col.label.left="black", 
            hetlab = "Heterogeneity: ", 
            print.I2 = Site$comb.fixed | Site$comb.random, 
            print.I2.ci = FALSE, 
            print.tau2 = FALSE, 
            print.Q = TRUE, 
            print.pval.Q = FALSE, 
            print.Rb = FALSE, 
            print.Rb.ci = FALSE,
            print.Q.subgroup = TRUE,
            test.subgroup = FALSE)

#print meta data on multiple
print(Site)

#funnel plot
funnel.meta(Site, pch=1, 
            col.fixed = "dodgerblue4",
            col.random = "lightskyblue3",
            backtransf = FALSE)

#test for asymmetry in funnel plot
metabias(Site, method.bias = "linreg", 
         plotit = TRUE, correct = TRUE,
         k.min=2)

