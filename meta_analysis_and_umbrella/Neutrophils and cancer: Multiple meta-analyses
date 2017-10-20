## Neutrophil counts and Cancer Prognosis:
## an Umbrella Review and Meta-analysis

# Assessment of all cancers cancers: 
# Multiple-NLR (OS,PFS, DFS)
# Multiple-Intra (CSS, OS)
# Multiple-Peri (OS)
# Multiple-Stro (OS)
# Soft (OS)
# 8 meta-analyses

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
dat <- read.xls(datfile, sheet="Multiple", perl="/usr/bin/perl")
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
multOS <- metagen(TE = dat$yi, seTE = dat$sei, data = NULL, studlab = dat$Author, 
                 subset=(dat$Outcome =="OS" & dat$Site == "Multiple"), sm ="HR", 
                 prediction = TRUE, comb.random = TRUE)

forest.meta(multOS, studlab = TRUE, 
            comb.random = multOS$comb.random, 
            comb.fixed = multOS$comb.fixed,
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
            print.I2 = multOS$comb.fixed | multOS$comb.random, 
            print.I2.ci = FALSE, 
            print.tau2 = FALSE, 
            print.Q =  TRUE, 
            print.Rb = FALSE, 
            print.Rb.ci = FALSE)

#print meta data on multOS
print(multOS)

#funnel plot
funnel.meta(multOS, pch=1, 
            col.fixed = "dodgerblue4",
            col.random = "lightskyblue3",
            backtransf = FALSE)

#test for asymmetry in funnel plot
metabias(multOS, method.bias = "linreg", 
         plotit = TRUE, correct = FALSE,
         k.min=2)





#Use generic inverse variance meta-analysis to calculate pooled HR from
#log(HR) and standard error
## inverse variance weighting is used for pooling results
multDFS <- metagen(TE = dat$yi, seTE = dat$sei, data = NULL, studlab = dat$Author, 
                  subset=(dat$Outcome =="DFS" & dat$Site == "Multiple"), sm ="HR", 
                  prediction = TRUE, comb.random = TRUE)

forest.meta(multDFS, studlab = TRUE, 
            comb.random = multDFS$comb.random, 
            comb.fixed = multDFS$comb.fixed,
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
            print.I2 = multDFS$comb.fixed | multDFS$comb.random, 
            print.I2.ci = FALSE, 
            print.tau2 = FALSE, 
            print.Q = TRUE, 
            print.Rb = FALSE, 
            print.Rb.ci = FALSE)

#print meta data on multPFS
print(multDFS)

#funnel plot
funnel.meta(multDFS, pch=1, 
            col.fixed = "dodgerblue4",
            col.random = "lightskyblue3",
            backtransf = FALSE)

#test for asymmetry in funnel plot
metabias(multDFS, method.bias = "linreg", 
         plotit = TRUE, correct = FALSE,
         k.min=2)





#Use generic inverse variance meta-analysis to calculate pooled HR from
#log(HR) and standard error
## inverse variance weighting is used for pooling results
multPFS <- metagen(TE = dat$yi, seTE = dat$sei, data = NULL, studlab = dat$Author, 
                  subset=(dat$Outcome =="PFS" & dat$Site == "Multiple"), sm ="HR", 
                  prediction = TRUE, comb.random = TRUE)

forest.meta(multPFS, studlab = TRUE, 
            comb.random = multPFS$comb.random, 
            comb.fixed = multPFS$comb.fixed,
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
            print.I2 = multPFS$comb.fixed | multPFS$comb.random, 
            print.I2.ci = FALSE, 
            print.tau2 = FALSE, 
            print.Q = TRUE, 
            print.Rb = FALSE, 
            print.Rb.ci = FALSE)

#print meta data on multPFS
print(multPFS)

#funnel plot
funnel.meta(multPFS, pch=1, 
            col.fixed = "dodgerblue4",
            col.random = "lightskyblue3",
            backtransf = FALSE)

#test for asymmetry in funnel plot
metabias(multPFS, method.bias = "linreg", 
         plotit = TRUE, correct = FALSE,
         k.min=2)





#Use generic inverse variance meta-analysis to calculate pooled HR from
#log(HR) and standard error
## inverse variance weighting is used for pooling results
multinCSS <- metagen(TE = dat$yi, seTE = dat$sei, data = NULL, studlab = dat$Author, 
                  subset=(dat$Outcome =="CSS" & dat$Site == "Multiple Intratumoural"), sm ="HR", 
                  prediction = TRUE, comb.random = TRUE)

forest.meta(multinCSS, studlab = TRUE, 
            comb.random = multinCSS$comb.random, 
            comb.fixed = multinCSS$comb.fixed,
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
            print.I2 = multinCSS$comb.fixed | multinCSS$comb.random, 
            print.I2.ci = FALSE, 
            print.tau2 = FALSE, 
            print.Q = TRUE, 
            print.Rb = FALSE, 
            print.Rb.ci = FALSE)

#print meta data on multinCSS
print(multinCSS)

#funnel plot
funnel.meta(multinCSS, pch=1, 
            col.fixed = "dodgerblue4",
            col.random = "lightskyblue3",
            backtransf = FALSE)

#test for asymmetry in funnel plot
metabias(multinCSS, method.bias = "linreg", 
         plotit = TRUE, correct = FALSE,
         k.min=2)





#Use generic inverse variance meta-analysis to calculate pooled HR from
#log(HR) and standard error
## inverse variance weighting is used for pooling results
multinOS <- metagen(TE = dat$yi, seTE = dat$sei, data = NULL, studlab = dat$Author, 
                  subset=(dat$Outcome =="OS" & dat$Site == "Multiple Intratumoural"), sm ="HR", 
                  prediction = TRUE, comb.random = TRUE)

forest.meta(multinOS, studlab = TRUE, 
            comb.random = multinOS$comb.random, 
            comb.fixed = multinOS$comb.fixed,
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
            print.I2 = multinOS$comb.fixed | multinOS$comb.random, 
            print.I2.ci = FALSE, 
            print.tau2 = FALSE, 
            print.Q = TRUE, 
            print.Rb = FALSE, 
            print.Rb.ci = FALSE)

#print meta data on multinOS
print(multinOS)

#funnel plot
funnel.meta(multinOS, pch=1, 
            col.fixed = "dodgerblue4",
            col.random = "lightskyblue3",
            backtransf = FALSE)

#test for asymmetry in funnel plot
metabias(multinOS, method.bias = "linreg", 
         plotit = TRUE, correct = FALSE,
         k.min=2)





#Use generic inverse variance meta-analysis to calculate pooled HR from
#log(HR) and standard error
## inverse variance weighting is used for pooling results
multperOS <- metagen(TE = dat$yi, seTE = dat$sei, data = NULL, studlab = dat$Author, 
                  subset=(dat$Outcome =="OS" & dat$Site == "Multiple Peritumoural"), sm ="HR", 
                  prediction = TRUE, comb.random = TRUE)

forest.meta(multperOS, studlab = TRUE, 
            comb.random = multperOS$comb.random, 
            comb.fixed = multperOS$comb.fixed,
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
            print.I2 = multperOS$comb.fixed | multperOS$comb.random, 
            print.I2.ci = FALSE, 
            print.tau2 = FALSE, 
            print.Q = TRUE, 
            print.Rb = FALSE, 
            print.Rb.ci = FALSE)

#print meta data on multerOS
print(multperOS)

#funnel plot
funnel.meta(multperOS, pch=1, 
            col.fixed = "dodgerblue4",
            col.random = "lightskyblue3",
            backtransf = FALSE)

#test for asymmetry in funnel plot
metabias(multperOS, method.bias = "linreg", 
         plotit = TRUE, correct = FALSE,
         k.min=2)





#Use generic inverse variance meta-analysis to calculate pooled HR from
#log(HR) and standard error
## inverse variance weighting is used for pooling results
multstrOS <- metagen(TE = dat$yi, seTE = dat$sei, data = NULL, studlab = dat$Author, 
                  subset=(dat$Outcome =="OS" & dat$Site == "Multiple Stromal"), sm ="HR", 
                  prediction = TRUE, comb.random = TRUE)

forest.meta(multstrOS, studlab = TRUE, 
            comb.random = multstrOS$comb.random, 
            comb.fixed = multstrOS$comb.fixed,
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
            print.I2 = multstrOS$comb.fixed | multstrOS$comb.random, 
            print.I2.ci = FALSE, 
            print.tau2 = FALSE, 
            print.Q = TRUE, 
            print.Rb = FALSE, 
            print.Rb.ci = FALSE)

#print meta data on multstrOS
print(multstrOS)

#funnel plot
funnel.meta(multstrOS, pch=1, 
            col.fixed = "dodgerblue4",
            col.random = "lightskyblue3",
            backtransf = FALSE)

#test for asymmetry in funnel plot
metabias(multstrOS, method.bias = "linreg", 
         plotit = TRUE, correct = FALSE,
         k.min=2)





#Use generic inverse variance meta-analysis to calculate pooled HR from
#log(HR) and standard error
## inverse variance weighting is used for pooling results
stsOS <- metagen(TE = dat$yi, seTE = dat$sei, data = NULL, studlab = dat$Author, 
                  subset=(dat$Outcome =="OS" & dat$Site == "Soft Tissue Sarcoma"), sm ="HR", 
                  prediction = TRUE, comb.random = TRUE)

forest.meta(stsOS, studlab = TRUE, 
            comb.random = stsOS$comb.random, 
            comb.fixed = stsOS$comb.fixed,
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
            print.I2 = stsOS$comb.fixed | stsOS$comb.random, 
            print.I2.ci = FALSE, 
            print.tau2 = FALSE, 
            print.Q = TRUE, 
            print.Rb = FALSE, 
            print.Rb.ci = FALSE)

#print meta data on stsOS
print(stsOS)

#funnel plot
funnel.meta(stsOS, pch=1, 
            col.fixed = "dodgerblue4",
            col.random = "lightskyblue3",
            backtransf = FALSE)

#test for asymmetry in funnel plot
metabias(stsOS, method.bias = "linreg", 
         plotit = TRUE, correct = FALSE,
         k.min=2)


# Figures for data visualisation and exploration


#bloxplots
box <- ggplot(data=dat, aes(x=Site, y=HR), 
              xlab="Site", ylab="Random Effects Hazard Ratio Estimate", 
              main="Boxplot of Hazard Ratio by Cancer Diagnosis") + 
  geom_boxplot(color="dodgerblue4", fill="lightskyblue3", outlier.color = NA,  
               alpha=0.5 ) +  coord_cartesian(ylim = c(0, 10)) + geom_jitter(alpha = 0.5, 
                                         color = "lightskyblue3") + theme_bw()
box




#plot by site on Y
box_out <- ggplot(data=dat, aes(x=Outcome, y=HR), 
                  xlab="Outcome", ylab="Random Effects Hazard Ratio Estimate", 
                  main="Boxplot of Hazard Ratio by Cancer Diagnosis") + 
  geom_boxplot(color="dodgerblue4", fill="lightskyblue3", outlier.color = NA,  
               alpha=0.5 ) +  coord_cartesian(ylim = c(0, 10)) + geom_jitter(alpha = 0.5, 
                                                                             color = "lightskyblue3") + theme_bw()
box_out
