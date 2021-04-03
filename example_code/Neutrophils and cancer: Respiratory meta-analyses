## Neutrophil counts and Cancer Prognosis:
## an Umbrella Review and Meta-analysis

# Assessment of respiratory cancers: 
# Lung OS, PFS
# MPM OS
# Nasopharyngeal OS, PFS, CSS
# NSCLC OS, PFS
# NSLCL OS
# NHC Intra OS
# 10 meta-analyses

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

dat$Upper.CI <- as.numeric(as.character(dat$Upper.CI))

#back transform 95% CIs to find standard error
#SE = [Log(U)-Log(HR)]/1.96
dat$sei <- ((log(dat$Upper.CI)-dat$yi)/1.96)


#Use generic inverse variance meta-analysis to calculate pooled HR from
#log(HR) and standard error
## inverse variance weighting is used for pooling results
lungOS <- metagen(TE = dat$yi, seTE = dat$sei, data = NULL, studlab = dat$Author, 
                  subset=(dat$Outcome =="OS" & dat$Site == "Lung"), sm ="HR", 
                  prediction = TRUE, comb.random = TRUE)

forest.meta(lungOS, studlab = TRUE, 
            comb.random = lungOS$comb.random, 
            comb.fixed = lungOS$comb.fixed,
            text.random = "Pooled HR by Random Effects",
            text.fixed = "Pooled HR by Fixed Effects", 
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
            print.I2 = lungOS$comb.fixed | lungOS$comb.random, 
            print.I2.ci = FALSE, 
            print.tau2 = FALSE, 
            print.Q = TRUE, 
            print.Rb = FALSE, 
            print.Rb.ci = FALSE)

#print meta data on lungOS
print(lungOS)

#funnel plot
funnel.meta(lungOS, pch=1, 
            col.fixed = "dodgerblue4",
            col.random = "lightskyblue3",
            backtransf = FALSE)

#test for asymmetry in funnel plot
metabias(lungOS, method.bias = "linreg", 
         plotit = TRUE, correct = FALSE,
         k.min=2)





#Use generic inverse variance meta-analysis to calculate pooled HR from
#log(HR) and standard error
## inverse variance weighting is used for pooling results
lungPFS <- metagen(TE = dat$yi, seTE = dat$sei, data = NULL, studlab = dat$Author, 
                  subset=(dat$Outcome =="PFS" & dat$Site == "Lung"), sm ="HR", 
                  prediction = TRUE, comb.random = TRUE)

forest.meta(lungPFS, studlab = TRUE, 
            comb.random = lungPFS$comb.random, 
            comb.fixed = lungPFS$comb.fixed,
            text.random = "Pooled HR by Random Effects",
            text.fixed = "Pooled HR by Fixed Effects", 
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
            print.I2 = lungPFS$comb.fixed | lungPFS$comb.random, 
            print.I2.ci = FALSE, 
            print.tau2 = FALSE, 
            print.Q = TRUE, 
            print.Rb = FALSE, 
            print.Rb.ci = FALSE)

#print meta data on lungPFS
print(lungPFS)

#funnel plot
funnel.meta(lungPFS, pch=1, 
            col.fixed = "dodgerblue4",
            col.random = "lightskyblue3",
            backtransf = FALSE)

#test for asymmetry in funnel plot
metabias(lungPFS, method.bias = "linreg", 
         plotit = TRUE, correct = FALSE,
         k.min=2)





#Use generic inverse variance meta-analysis to calculate pooled HR from
#log(HR) and standard error
## inverse variance weighting is used for pooling results
mpmOS <- metagen(TE = dat$yi, seTE = dat$sei, data = NULL, studlab = dat$Author, 
                  subset=(dat$Outcome =="OS" & dat$Site == "MPM"), sm ="HR", 
                  prediction = TRUE, comb.random = TRUE)

forest.meta(mpmOS, studlab = TRUE, 
            comb.random = mpmOS$comb.random, 
            comb.fixed = mpmOS$comb.fixed,
            text.random = "Pooled HR by Random Effects",
            text.fixed = "Pooled HR by Fixed Effects", 
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
            print.I2 = mpmOS$comb.fixed | mpmOS$comb.random, 
            print.I2.ci = FALSE, 
            print.tau2 = FALSE, 
            print.Q = TRUE, 
            print.Rb = FALSE, 
            print.Rb.ci = FALSE)

#print meta data on mpmOS
print(mpmOS)

#funnel plot
funnel.meta(mpmOS, pch=1, 
            col.fixed = "dodgerblue4",
            col.random = "lightskyblue3",
            backtransf = FALSE)

#test for asymmetry in funnel plot
metabias(mpmOS, method.bias = "linreg", 
         plotit = TRUE, correct = FALSE,
         k.min=2)





#Use generic inverse variance meta-analysis to calculate pooled HR from
#log(HR) and standard error
## inverse variance weighting is used for pooling results
nasOS <- metagen(TE = dat$yi, seTE = dat$sei, data = NULL, studlab = dat$Author, 
                  subset=(dat$Outcome =="OS" & dat$Site == "Nasopharyngeal"), sm ="HR", 
                  prediction = TRUE, comb.random = TRUE)

forest.meta(nasOS, studlab = TRUE, 
            comb.random = nasOS$comb.random, 
            comb.fixed = nasOS$comb.fixed,
            text.random = "Pooled HR by Random Effects",
            text.fixed = "Pooled HR by Fixed Effects", 
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
            print.I2 = nasOS$comb.fixed | nasOS$comb.random, 
            print.I2.ci = FALSE, 
            print.tau2 = FALSE, 
            print.Q = TRUE, 
            print.Rb = FALSE, 
            print.Rb.ci = FALSE)

#print meta data on nasOS
print(nasOS)

#funnel plot
funnel.meta(nasOS, pch=1, 
            col.fixed = "dodgerblue4",
            col.random = "lightskyblue3",
            backtransf = FALSE)

#test for asymmetry in funnel plot
metabias(nasOS, method.bias = "linreg", 
         plotit = TRUE, correct = FALSE,
         k.min=2)





#Use generic inverse variance meta-analysis to calculate pooled HR from
#log(HR) and standard error
## inverse variance weighting is used for pooling results
nasPFS <- metagen(TE = dat$yi, seTE = dat$sei, data = NULL, studlab = dat$Author, 
                 subset=(dat$Outcome =="PFS" & dat$Site == "Nasopharyngeal"), sm ="HR", 
                 prediction = TRUE, comb.random = TRUE)

forest.meta(nasPFS, studlab = TRUE, 
            comb.random = nasPFS$comb.random, 
            comb.fixed = nasPFS$comb.fixed,
            text.random = "Pooled HR by Random Effects",
            text.fixed = "Pooled HR by Fixed Effects", 
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
            print.I2 = nasPFS$comb.fixed | nasPFS$comb.random, 
            print.I2.ci = FALSE, 
            print.tau2 = FALSE, 
            print.Q = TRUE, 
            print.Rb = FALSE, 
            print.Rb.ci = FALSE)

#print meta data on nasPFS
print(nasPFS)

#funnel plot
funnel.meta(nasPFS, pch=1, 
            col.fixed = "dodgerblue4",
            col.random = "lightskyblue3",
            backtransf = FALSE)

#test for asymmetry in funnel plot
metabias(nasPFS, method.bias = "linreg", 
         plotit = TRUE, correct = FALSE,
         k.min=2)





#Use generic inverse variance meta-analysis to calculate pooled HR from
#log(HR) and standard error
## inverse variance weighting is used for pooling results
nasCSS <- metagen(TE = dat$yi, seTE = dat$sei, data = NULL, studlab = dat$Author, 
                  subset=(dat$Outcome =="CSS" & dat$Site == "Nasopharyngeal"), sm ="HR", 
                  prediction = TRUE, comb.random = TRUE)

forest.meta(nasCSS, studlab = TRUE, 
            comb.random = nasCSS$comb.random, 
            comb.fixed = nasCSS$comb.fixed,
            text.random = "Pooled HR by Random Effects",
            text.fixed = "Pooled HR by Fixed Effects", 
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
            print.I2 = nasCSS$comb.fixed | nasCSS$comb.random, 
            print.I2.ci = FALSE, 
            print.tau2 = FALSE, 
            print.Q = TRUE, 
            print.Rb = FALSE, 
            print.Rb.ci = FALSE)

#print meta data on nasCSS
print(nasCSS)

#funnel plot
funnel.meta(nasCSS, pch=1, 
            col.fixed = "dodgerblue4",
            col.random = "lightskyblue3",
            backtransf = FALSE)

#test for asymmetry in funnel plot
metabias(nasCSS, method.bias = "linreg", 
         plotit = TRUE, correct = FALSE,
         k.min=2)





#Use generic inverse variance meta-analysis to calculate pooled HR from
#log(HR) and standard error
## inverse variance weighting is used for pooling results
nsclcOS <- metagen(TE = dat$yi, seTE = dat$sei, data = NULL, studlab = dat$Author, 
                 subset=(dat$Outcome =="OS" & dat$Site == "NSCLC"), sm ="HR", 
                 prediction = TRUE, comb.random = TRUE)

forest.meta(nsclcOS, studlab = TRUE, 
            comb.random = nsclcOS$comb.random, 
            comb.fixed = nsclcOS$comb.fixed,
            text.random = "Pooled HR by Random Effects",
            text.fixed = "Pooled HR by Fixed Effects", 
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
            print.I2 = nsclcOS$comb.fixed | nsclcOS$comb.random, 
            print.I2.ci = FALSE, 
            print.tau2 = FALSE, 
            print.Q = TRUE,  
            print.Rb = FALSE, 
            print.Rb.ci = FALSE)

#print meta data on nsclcOS
print(nsclcOS)

#funnel plot
funnel.meta(nsclcOS, pch=1, 
            col.fixed = "dodgerblue4",
            col.random = "lightskyblue3",
            backtransf = FALSE)

#test for asymmetry in funnel plot
metabias(nsclcOS, method.bias = "linreg", 
         plotit = TRUE, correct = FALSE,
         k.min=2)





#Use generic inverse variance meta-analysis to calculate pooled HR from
#log(HR) and standard error
## inverse variance weighting is used for pooling results
nsclcPFS <- metagen(TE = dat$yi, seTE = dat$sei, data = NULL, studlab = dat$Author, 
                 subset=(dat$Outcome =="PFS" & dat$Site == "NSCLC"), sm ="HR", 
                 prediction = TRUE, comb.random = TRUE)

forest.meta(nsclcPFS, studlab = TRUE, 
            comb.random = nsclcPFS$comb.random, 
            comb.fixed = nsclcPFS$comb.fixed,
            text.random = "Pooled HR by Random Effects",
            text.fixed = "Pooled HR by Fixed Effects", 
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
            print.I2 = nsclcPFS$comb.fixed | nsclcPFS$comb.random, 
            print.I2.ci = FALSE, 
            print.tau2 = FALSE, 
            print.Q = TRUE,  
            print.Rb = FALSE, 
            print.Rb.ci = FALSE)

#print meta data on nsclcPFS
print(nsclcPFS)

#funnel plot
funnel.meta(nsclcPFS, pch=1, 
            col.fixed = "dodgerblue4",
            col.random = "lightskyblue3",
            backtransf = FALSE)

#test for asymmetry in funnel plot
metabias(nsclcPFS, method.bias = "linreg", 
         plotit = TRUE, correct = FALSE,
         k.min=2)





#Use generic inverse variance meta-analysis to calculate pooled HR from
#log(HR) and standard error
## inverse variance weighting is used for pooling results
nscinOS <- metagen(TE = dat$yi, seTE = dat$sei, data = NULL, studlab = dat$Author, 
                 subset=(dat$Outcome =="OS" & dat$Site == "NSCLC Intratumoural"), sm ="HR", 
                 prediction = TRUE, comb.random = TRUE)

forest.meta(nscinOS, studlab = TRUE, 
            comb.random = nscinOS$comb.random, 
            comb.fixed = nscinOS$comb.fixed,
            text.random = "Pooled HR by Random Effects",
            text.fixed = "Pooled HR by Fixed Effects", 
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
            print.I2 = nscinOS$comb.fixed | nscinOS$comb.random, 
            print.I2.ci = FALSE, 
            print.tau2 = FALSE, 
            print.Q = TRUE,  
            print.Rb = FALSE, 
            print.Rb.ci = FALSE)

#print meta data on nscinOS
print(nscinOS)

#funnel plot
funnel.meta(nscinOS, pch=1, 
            col.fixed = "dodgerblue4",
            col.random = "lightskyblue3",
            backtransf = FALSE)

#test for asymmetry in funnel plot
metabias(nscinOS, method.bias = "linreg", 
         plotit = TRUE, correct = FALSE,
         k.min=2)





#Use generic inverse variance meta-analysis to calculate pooled HR from
#log(HR) and standard error
## inverse variance weighting is used for pooling results
nhcOS <- metagen(TE = dat$yi, seTE = dat$sei, data = NULL, studlab = dat$Author, 
                 subset=(dat$Outcome =="OS" & dat$Site == "NHC Intratumoural"), sm ="HR", 
                 prediction = TRUE, comb.random = TRUE)

forest.meta(nhcOS, studlab = TRUE, 
            comb.random = nhcOS$comb.random, 
            comb.fixed = nhcOS$comb.fixed,
            text.random = "Pooled HR by Random Effects",
            text.fixed = "Pooled HR by Fixed Effects", 
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
            print.I2 = nhcOS$comb.fixed | nhcOS$comb.random, 
            print.I2.ci = FALSE, 
            print.tau2 = FALSE, 
            print.Q = TRUE, 
            print.Rb = FALSE, 
            print.Rb.ci = FALSE)

#print meta data on nhcOS
print(nhcOS)

#funnel plot
funnel.meta(nhcOS, pch=1, 
            col.fixed = "dodgerblue4",
            col.random = "lightskyblue3",
            backtransf = FALSE)

#test for asymmetry in funnel plot
metabias(nhcOS, method.bias = "linreg", 
         plotit = TRUE, correct = FALSE,
         k.min=2)



# Figures for data visualisation and analysis


#load ggplot2
library(ggplot2)

#make Site categorical to bin by site on boxplot x axis
dat$Site <- as.character(dat$Site)
typeof(dat$Site)
typeof(dat$HR)


#bloxplots
box <- ggplot(data=dat, aes(x=Site, y=HR), 
              xlab="Site", ylab="Random Effects Hazard Ratio Estimate", 
              main="Boxplot of Hazard Ratio by Cancer Diagnosis") + 
  geom_boxplot(color="dodgerblue4", fill="lightskyblue3", outlier.color = NA,  
               alpha=0.5 ) + geom_jitter(alpha = 0.5, 
                                         color = "lightskyblue3") + theme_bw()
box


#plot by site on Y
box_out <- ggplot(data=dat, aes(x=Outcome, y=HR), 
                  xlab="Outcome", ylab="Random Effects Hazard Ratio Estimate", 
                  main="Boxplot of Hazard Ratio by Cancer Diagnosis") + 
  geom_boxplot(color="dodgerblue4", fill="lightskyblue3", outlier.color = "dodgerblue4",  
               alpha=0.5 ) + geom_jitter(alpha = 0.5, 
                                                                             color = "lightskyblue3") + theme_bw()
box_out
