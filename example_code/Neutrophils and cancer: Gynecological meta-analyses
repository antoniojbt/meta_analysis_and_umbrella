## Neutrophil counts and Cancer Prognosis:
## an Umbrella Review and Meta-analysis

# Assessment of Gynecological cancers: Gynecologic (OS),
# Breast (OS, DFS), Cervical (OS, PFS), Ovarian (PFS)
# -> total 6 meta-analyses and funnel plots

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
dat <- read.xls(datfile, sheet="Gynecological", perl="/usr/bin/perl")
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
gynOS <- metagen(TE = dat$yi, seTE = dat$sei, data = NULL, studlab = dat$Author, 
        subset=(dat$Outcome =="OS" & dat$Site == "Gynecologic"), sm ="HR", 
        prediction = TRUE, comb.random = TRUE)

forest.meta(gynOS, studlab = TRUE, 
            comb.random = gynOS$comb.random, 
            comb.fixed = gynOS$comb.fixed,
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
            print.I2 = gynOS$comb.fixed | gynOS$comb.random, 
            print.I2.ci = FALSE, 
            print.tau2 = FALSE, 
            print.Q = TRUE, 
            print.Rb = FALSE, 
            print.Rb.ci = FALSE)

#print meta data on gynOS
print(gynOS)

#funnel plot
funnel.meta(gynOS, pch=1, 
            col.fixed = "dodgerblue4",
            col.random = "lightskyblue3",
            backtransf = FALSE)

#test for asymmetry in funnel plot
metabias(gynOS, method.bias = "linreg", 
         plotit = TRUE, correct = FALSE,
         k.min=2)





#Use generic inverse variance meta-analysis to calculate pooled HR from
#log(HR) and standard error
## inverse variance weighting is used for pooling results
breOS <- metagen(TE = dat$yi, seTE = dat$sei, data = NULL, studlab = dat$Author, 
                 subset=(dat$Outcome =="OS" & dat$Site == "Breast"), sm ="HR", 
                 prediction = TRUE, comb.random = TRUE)

forest.meta(breOS, studlab = TRUE, 
            comb.random = breOS$comb.random, 
            comb.fixed = breOS$comb.fixed,
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
            print.I2 = breOS$comb.fixed | breOS$comb.random, 
            print.I2.ci = FALSE, 
            print.tau2 = FALSE, 
            print.Q = TRUE, 
            print.Rb = FALSE, 
            print.Rb.ci = FALSE)

#print meta data on breOS
print(breOS)

#funnel plot
funnel.meta(breOS, pch=1, 
            col.fixed = "dodgerblue4",
            col.random = "lightskyblue3",
            backtransf = FALSE)

#test for asymmetry in funnel plot
metabias(breOS, method.bias = "linreg", 
         plotit = TRUE, correct = FALSE,
         k.min=2)





#Use generic inverse variance meta-analysis to calculate pooled HR from
#log(HR) and standard error
## inverse variance weighting is used for pooling results
breDFS <- metagen(TE = dat$yi, seTE = dat$sei, data = NULL, studlab = dat$Author, 
                 subset=(dat$Outcome =="DFS" & dat$Site == "Breast"), sm ="HR", 
                 prediction = TRUE, comb.random = TRUE)

forest.meta(breDFS, studlab = TRUE, 
            comb.random = breDFS$comb.random, 
            comb.fixed = breDFS$comb.fixed,
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
            print.I2 = breDFS$comb.fixed | breDFS$comb.random, 
            print.I2.ci = FALSE, 
            print.tau2 = FALSE, 
            print.Q = TRUE, 
            print.Rb = FALSE, 
            print.Rb.ci = FALSE)

#print meta data on breDFS
print(breDFS)

#funnel plot
funnel.meta(breDFS, pch=1, 
            col.fixed = "dodgerblue4",
            col.random = "lightskyblue3",
            backtransf = FALSE)

#test for asymmetry in funnel plot
metabias(breDFS, method.bias = "linreg", 
         plotit = TRUE, correct = FALSE,
         k.min=2)





#Use generic inverse variance meta-analysis to calculate pooled HR from
#log(HR) and standard error
## inverse variance weighting is used for pooling results
cerOS <- metagen(TE = dat$yi, seTE = dat$sei, data = NULL, studlab = dat$Author, 
                  subset=(dat$Outcome =="OS" & dat$Site == "Cervical"), sm ="HR", 
                  prediction = TRUE, comb.random = TRUE)

forest.meta(cerOS, studlab = TRUE, 
            comb.random = cerOS$comb.random, 
            comb.fixed = cerOS$comb.fixed,
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
            print.I2 = cerOS$comb.fixed | cerOS$comb.random, 
            print.I2.ci = FALSE, 
            print.tau2 = FALSE, 
            print.Q = TRUE, 
            print.Rb = FALSE, 
            print.Rb.ci = FALSE)

#print meta data on cerOS
print(cerOS)

#funnel plot
funnel.meta(cerOS, pch=1, 
            col.fixed = "dodgerblue4",
            col.random = "lightskyblue3",
            backtransf = FALSE)

#test for asymmetry in funnel plot
metabias(cerOS, method.bias = "linreg", 
         plotit = TRUE, correct = FALSE,
         k.min=2)





#Use generic inverse variance meta-analysis to calculate pooled HR from
#log(HR) and standard error
## inverse variance weighting is used for pooling results
cerPFS <- metagen(TE = dat$yi, seTE = dat$sei, data = NULL, studlab = dat$Author, 
                  subset=(dat$Outcome =="PFS" & dat$Site == "Cervical"), sm ="HR", 
                  prediction = TRUE, comb.random = TRUE)

forest.meta(cerPFS, studlab = TRUE, 
            comb.random = cerPFS$comb.random, 
            comb.fixed = cerPFS$comb.fixed,
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
            print.I2 = cerPFS$comb.fixed | cerPFS$comb.random, 
            print.I2.ci = FALSE, 
            print.tau2 = FALSE, 
            print.Q = TRUE, 
            print.Rb = FALSE, 
            print.Rb.ci = FALSE)

#print meta data on cerPFS
print(cerPFS)

#funnel plot
funnel.meta(cerPFS, pch=1, 
            col.fixed = "dodgerblue4",
            col.random = "lightskyblue3",
            backtransf = FALSE)

#test for asymmetry in funnel plot
metabias(cerPFS, method.bias = "linreg", 
         plotit = TRUE, correct = FALSE,
         k.min=2)





#Use generic inverse variance meta-analysis to calculate pooled HR from
#log(HR) and standard error
## inverse variance weighting is used for pooling results
ovaPFS <- metagen(TE = dat$yi, seTE = dat$sei, data = NULL, studlab = dat$Author, 
                  subset=(dat$Outcome =="PFS" & dat$Site == "Ovarian"), sm ="HR", 
                  prediction = TRUE, comb.random = TRUE)

forest.meta(ovaPFS, studlab = TRUE, 
            comb.random = ovaPFS$comb.random, 
            comb.fixed = ovaPFS$comb.fixed,
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
            print.I2 = ovaPFS$comb.fixed | ovaPFS$comb.random, 
            print.I2.ci = FALSE, 
            print.tau2 = FALSE, 
            print.Q = TRUE, 
            print.Rb = FALSE, 
            print.Rb.ci = FALSE)

#print meta data on ovaPFS
print(ovaPFS)

#funnel plot
funnel.meta(ovaPFS, pch=1, 
            col.fixed = "dodgerblue4",
            col.random = "lightskyblue3",
            backtransf = FALSE)

#test for asymmetry in funnel plot
metabias(ovaPFS, method.bias = "linreg", 
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
               alpha=0.5 )  +  coord_cartesian(ylim = c(0, 10)) + geom_jitter(alpha = 0.5, 
                                                                              color = "lightskyblue3") + theme_bw()
box




#plot by site on Y
box_out <- ggplot(data=dat, aes(x=Outcome, y=HR), 
                  xlab="Outcome", ylab="Random Effects Hazard Ratio Estimate", 
                  main="Boxplot of Hazard Ratio by Cancer Diagnosis") + 
  geom_boxplot(color="dodgerblue4", fill="lightskyblue3", outlier.color = NA,  
               alpha=0.5 ) + geom_jitter(alpha = 0.5, 
                                                                             color = "lightskyblue3") + theme_bw()
box_out
