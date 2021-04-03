## Neutrophil counts and Cancer Prognosis:
## an Umbrella Review and Meta-analysis

# Assessment of hepatocellular cancers: 
# HCC (OS, DFS)
# HCC ICC (OS)
# HCC MT (OS) 
# HCC re (OS, DFS)
# HCC RFA (DFS, OS)
# HCC TACE (OS)
# HCC Trans (DFS, OS)
# 11 meta-analyses

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
dat <- read.xls(datfile, sheet="Liver", perl="/usr/bin/perl")
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
hccOS <- metagen(TE = dat$yi, seTE = dat$sei, data = NULL, studlab = dat$Author, 
                 subset=(dat$Outcome =="OS" & dat$Site == "HCC"), sm ="HR", 
                 prediction = TRUE, comb.random = TRUE)

forest.meta(hccOS, studlab = TRUE, 
            comb.random = hccOS$comb.random, 
            comb.fixed = hccOS$comb.fixed,
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
            print.I2 = hccOS$comb.fixed | hccOS$comb.random, 
            print.I2.ci = FALSE, 
            print.tau2 = FALSE, 
            print.Q = TRUE, 
            print.Rb = FALSE, 
            print.Rb.ci = FALSE)

#print meta data on hccOS
print(hccOS)

#funnel plot
funnel.meta(hccOS, pch=1, 
            col.fixed = "dodgerblue4",
            col.random = "lightskyblue3",
            backtransf = FALSE)

#test for asymmetry in funnel plot
metabias(hccOS, method.bias = "linreg", 
         plotit = TRUE, correct = FALSE,
         k.min=2)





#Use generic inverse variance meta-analysis to calculate pooled HR from
#log(HR) and standard error
## inverse variance weighting is used for pooling results
hccDFS <- metagen(TE = dat$yi, seTE = dat$sei, data = NULL, studlab = dat$Author, 
                 subset=(dat$Outcome =="DFS" & dat$Site == "HCC"), sm ="HR", 
                 prediction = TRUE, comb.random = TRUE)

forest.meta(hccDFS, studlab = TRUE, 
            comb.random = hccDFS$comb.random, 
            comb.fixed = hccDFS$comb.fixed,
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
            print.I2 = hccDFS$comb.fixed | hccDFS$comb.random, 
            print.I2.ci = FALSE, 
            print.tau2 = FALSE, 
            print.Q = TRUE, 
            print.Rb = FALSE, 
            print.Rb.ci = FALSE)

#print meta data on hccDFS
print(hccDFS)

#funnel plot
funnel.meta(hccDFS, pch=1, 
            col.fixed = "dodgerblue4",
            col.random = "lightskyblue3",
            backtransf = FALSE)

#test for asymmetry in funnel plot
metabias(hccDFS, method.bias = "linreg", 
         plotit = TRUE, correct = FALSE,
         k.min=2)






#Use generic inverse variance meta-analysis to calculate pooled HR from
#log(HR) and standard error
## inverse variance weighting is used for pooling results
hcciccOS <- metagen(TE = dat$yi, seTE = dat$sei, data = NULL, studlab = dat$Author, 
                 subset=(dat$Outcome =="OS" & dat$Site == "HCC ICC"), sm ="HR", 
                 prediction = TRUE, comb.random = TRUE)

forest.meta(hcciccOS, studlab = TRUE, 
            comb.random = hcciccOS$comb.random, 
            comb.fixed = hcciccOS$comb.fixed,
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
            print.I2 = hcciccOS$comb.fixed | hcciccOS$comb.random, 
            print.I2.ci = FALSE, 
            print.tau2 = FALSE, 
            print.Q = TRUE, 
            print.Rb = FALSE, 
            print.Rb.ci = FALSE)

#print meta data on hcciccOS
print(hcciccOS)

#funnel plot
funnel.meta(hcciccOS, pch=1, 
            col.fixed = "dodgerblue4",
            col.random = "lightskyblue3",
            backtransf = FALSE)

#test for asymmetry in funnel plot
metabias(hcciccOS, method.bias = "linreg", 
         plotit = TRUE, correct = FALSE,
         k.min=2)





#Use generic inverse variance meta-analysis to calculate pooled HR from
#log(HR) and standard error
## inverse variance weighting is used for pooling results
hccmtOS <- metagen(TE = dat$yi, seTE = dat$sei, data = NULL, studlab = dat$Author, 
                    subset=(dat$Outcome =="OS" & dat$Site == "HCC MT"), sm ="HR", 
                    prediction = TRUE, comb.random = TRUE)

forest.meta(hccmtOS, studlab = TRUE, 
            comb.random = hccmtOS$comb.random, 
            comb.fixed = hccmtOS$comb.fixed,
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
            print.I2 = hccmtOS$comb.fixed | hccmtOS$comb.random, 
            print.I2.ci = FALSE, 
            print.tau2 = FALSE, 
            print.Q = TRUE, 
            print.Rb = FALSE, 
            print.Rb.ci = FALSE)

#print meta data on hccmtOS
print(hccmtOS)

#funnel plot
funnel.meta(hccmtOS, pch=1, 
            col.fixed = "dodgerblue4",
            col.random = "lightskyblue3",
            backtransf = FALSE)

#test for asymmetry in funnel plot
metabias(hccmtOS, method.bias = "linreg", 
         plotit = TRUE, correct = FALSE,
         k.min=2)





#Use generic inverse variance meta-analysis to calculate pooled HR from
#log(HR) and standard error
## inverse variance weighting is used for pooling results
hccreOS <- metagen(TE = dat$yi, seTE = dat$sei, data = NULL, studlab = dat$Author, 
                    subset=(dat$Outcome =="OS" & dat$Site == "HCC Resection"), sm ="HR", 
                    prediction = TRUE, comb.random = TRUE)

forest.meta(hccreOS, studlab = TRUE, 
            comb.random = hccreOS$comb.random, 
            comb.fixed = hccreOS$comb.fixed,
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
            print.I2 = hccreOS$comb.fixed | hccreOS$comb.random, 
            print.I2.ci = FALSE, 
            print.tau2 = FALSE, 
            print.Q = TRUE, 
            print.Rb = FALSE, 
            print.Rb.ci = FALSE)

#print meta data on hccreOS
print(hccreOS)

#funnel plot
funnel.meta(hccreOS, pch=1, 
            col.fixed = "dodgerblue4",
            col.random = "lightskyblue3",
            backtransf = FALSE)

#test for asymmetry in funnel plot
metabias(hccreOS, method.bias = "linreg", 
         plotit = TRUE, correct = FALSE,
         k.min=2)

#Use generic inverse variance meta-analysis to calculate pooled HR from
#log(HR) and standard error
## inverse variance weighting is used for pooling results
hccreDFS <- metagen(TE = dat$yi, seTE = dat$sei, data = NULL, studlab = dat$Author, 
                   subset=(dat$Outcome =="DFS" & dat$Site == "HCC Resection"), sm ="HR", 
                   prediction = TRUE, comb.random = TRUE)

forest.meta(hccreDFS, studlab = TRUE, 
            comb.random = hccreDFS$comb.random, 
            comb.fixed = hccreDFS$comb.fixed,
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
            print.I2 = hccreDFS$comb.fixed | hccreDFS$comb.random, 
            print.I2.ci = FALSE, 
            print.tau2 = FALSE, 
            print.Q = TRUE, 
            print.Rb = FALSE, 
            print.Rb.ci = FALSE)

#print meta data on hccreDFS
print(hccreDFS)

#funnel plot
funnel.meta(hccreDFS, pch=1, 
            col.fixed = "dodgerblue4",
            col.random = "lightskyblue3",
            backtransf = FALSE)

#test for asymmetry in funnel plot
metabias(hccreDFS, method.bias = "linreg", 
         plotit = TRUE, correct = FALSE,
         k.min=2)





#Use generic inverse variance meta-analysis to calculate pooled HR from
#log(HR) and standard error
## inverse variance weighting is used for pooling results
hccrfaOS <- metagen(TE = dat$yi, seTE = dat$sei, data = NULL, studlab = dat$Author, 
                   subset=(dat$Outcome =="OS" & dat$Site == "HCC RFA"), sm ="HR", 
                   prediction = TRUE, comb.random = TRUE)

forest.meta(hccrfaOS, studlab = TRUE, 
            comb.random = hccrfaOS$comb.random, 
            comb.fixed = hccrfaOS$comb.fixed,
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
            print.I2 = hccrfaOS$comb.fixed | hccrfaOS$comb.random, 
            print.I2.ci = FALSE, 
            print.tau2 = FALSE, 
            print.Q = TRUE, 
            print.Rb = FALSE, 
            print.Rb.ci = FALSE)

#print meta data on hccrfaOS
print(hccrfaOS)

#funnel plot
funnel.meta(hccrfaOS, pch=1, 
            col.fixed = "dodgerblue4",
            col.random = "lightskyblue3",
            backtransf = FALSE)

#test for asymmetry in funnel plot
metabias(hccrfaOS, method.bias = "linreg", 
         plotit = TRUE, correct = FALSE,
         k.min=2)





#Use generic inverse variance meta-analysis to calculate pooled HR from
#log(HR) and standard error
## inverse variance weighting is used for pooling results
hccrfaDFS <- metagen(TE = dat$yi, seTE = dat$sei, data = NULL, studlab = dat$Author, 
                    subset=(dat$Outcome =="DFS" & dat$Site == "HCC RFA"), sm ="HR", 
                    prediction = TRUE, comb.random = TRUE)

forest.meta(hccrfaDFS, studlab = TRUE, 
            comb.random = hccrfaDFS$comb.random, 
            comb.fixed = hccrfaDFS$comb.fixed,
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
            print.I2 = hccrfaDFS$comb.fixed | hccrfaDFS$comb.random, 
            print.I2.ci = FALSE, 
            print.tau2 = FALSE, 
            print.Q = TRUE, 
            print.Rb = FALSE, 
            print.Rb.ci = FALSE)

#print meta data on hccrfaDFS
print(hccrfaDFS)

#funnel plot
funnel.meta(hccrfaDFS, pch=1, 
            col.fixed = "dodgerblue4",
            col.random = "lightskyblue3",
            backtransf = FALSE)

#test for asymmetry in funnel plot
metabias(hccrfaDFS, method.bias = "linreg", 
         plotit = TRUE, correct = FALSE,
         k.min=2)





#Use generic inverse variance meta-analysis to calculate pooled HR from
#log(HR) and standard error
## inverse variance weighting is used for pooling results
hcctOS <- metagen(TE = dat$yi, seTE = dat$sei, data = NULL, studlab = dat$Author, 
                    subset=(dat$Outcome =="OS" & dat$Site == "HCC TACE"), sm ="HR", 
                    prediction = TRUE, comb.random = TRUE)

forest.meta(hcctOS, studlab = TRUE, 
            comb.random = hcctOS$comb.random, 
            comb.fixed = hcctOS$comb.fixed,
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
            print.I2 = hcctOS$comb.fixed | hcctOS$comb.random, 
            print.I2.ci = FALSE, 
            print.tau2 = FALSE, 
            print.Q = TRUE, 
            print.Rb = FALSE, 
            print.Rb.ci = FALSE)

#print meta data on hcctOS
print(hcctOS)

#funnel plot
funnel.meta(hcctOS, pch=1, 
            col.fixed = "dodgerblue4",
            col.random = "lightskyblue3",
            backtransf = FALSE)

#test for asymmetry in funnel plot
metabias(hcctOS, method.bias = "linreg", 
         plotit = TRUE, correct = FALSE,
         k.min=2)


#Use generic inverse variance meta-analysis to calculate pooled HR from
#log(HR) and standard error
## inverse variance weighting is used for pooling results
hcctranOS <- metagen(TE = dat$yi, seTE = dat$sei, data = NULL, studlab = dat$Author, 
                    subset=(dat$Outcome =="OS" & dat$Site == "HCC Transplant"), sm ="HR", 
                    prediction = TRUE, comb.random = TRUE)

forest.meta(hcctranOS, studlab = TRUE, 
            comb.random = hcctranOS$comb.random, 
            comb.fixed = hcctranOS$comb.fixed,
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
            print.I2 = hcctranOS$comb.fixed | hcctranOS$comb.random, 
            print.I2.ci = FALSE, 
            print.tau2 = FALSE, 
            print.Q = TRUE, 
            print.Rb = FALSE, 
            print.Rb.ci = FALSE)

#print meta data on hcctranOS
print(hcctranOS)

#funnel plot
funnel.meta(hcctranOS, pch=1, 
            col.fixed = "dodgerblue4",
            col.random = "lightskyblue3",
            backtransf = FALSE)

#test for asymmetry in funnel plot
metabias(hcctranOS, method.bias = "linreg", 
         plotit = TRUE, correct = FALSE,
         k.min=2)





#Use generic inverse variance meta-analysis to calculate pooled HR from
#log(HR) and standard error
## inverse variance weighting is used for pooling results
hcctranDFS <- metagen(TE = dat$yi, seTE = dat$sei, data = NULL, studlab = dat$Author, 
                     subset=(dat$Outcome =="DFS" & dat$Site == "HCC Transplant"), sm ="HR", 
                     prediction = TRUE, comb.random = TRUE)

forest.meta(hcctranDFS, studlab = TRUE, 
            comb.random = hcctranDFS$comb.random, 
            comb.fixed = hcctranDFS$comb.fixed,
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
            print.I2 = hcctranDFS$comb.fixed | hcctranDFS$comb.random, 
            print.I2.ci = FALSE, 
            print.tau2 = FALSE, 
            print.Q = TRUE, 
            print.Rb = FALSE, 
            print.Rb.ci = FALSE)

#print meta data on hcctranDFS
print(hcctranDFS)

#funnel plot
funnel.meta(hcctranDFS, pch=1, 
            col.fixed = "dodgerblue4",
            col.random = "lightskyblue3",
            backtransf = FALSE)

#test for asymmetry in funnel plot
metabias(hcctranDFS, method.bias = "linreg", 
         plotit = TRUE, correct = FALSE,
         k.min=2)


# Figures for data visualisation and exploration


#load ggplot2
library(ggplot2)

#make Site categorical to bin by site on boxplot x axis
dat$Site <- as.character(dat$Site)
typeof(dat$Site)
typeof(dat$HR)

#Boxplots

#create boxplot in ggplot2
box <- ggplot(data=dat, aes(x=Site, y=HR), 
              xlab="Site", ylab="Random Effects Hazard Ratio Estimate", 
              main="Boxplot of Hazard Ratio by Cancer Diagnosis") + 
  geom_boxplot(color="dodgerblue4", fill="lightskyblue3", outlier.color = NA,  
               alpha=0.5 ) +  coord_cartesian(ylim = c(0, 10))+ geom_jitter(alpha = 0.5, 
                                                                              color = "lightskyblue3") + theme_bw()
box


#plot by site on Y
box_out <- ggplot(data=dat, aes(x=Outcome, y=HR), 
                  xlab="Outcome", ylab="Random Effects Hazard Ratio Estimate", 
                  main="Boxplot of Hazard Ratio by Cancer Diagnosis") + 
  geom_boxplot(color="dodgerblue4", fill="lightskyblue3", outlier.color = "dodgerblue4",  
               alpha=0.5 ) +  coord_cartesian(ylim = c(0, 40)) + geom_jitter(alpha = 0.5, 
                                                                             color = "lightskyblue3") + theme_bw()
box_out
