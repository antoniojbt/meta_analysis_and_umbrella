#Summary figures for results
#Aggregated boxplot and histogram
#Largest study HR vs Random Effects
#1/variance plot

require(gdata)
#Link the Excel Databook at your file path

datfile = "~/Google Drive/Dissertation/Chapters/Data Extraction/Data set.xlsx"
#Call "read.xls" to read the specific Excel data sheet
dat <- read.xls(datfile, sheet="Random", perl="/usr/bin/perl")
#Print the data
print(dat)
View(dat)

#Effect sizes == LogHR
#Calculate log HR
dat$yi <- with(dat, log(HR))


#calculate log effect size for the largest study
dat$largeyi <- with(dat, log(Largest.HR))

#back transform 95% CIs to find standard error
#SE = [Log(U)-Log(HR)]/1.96
dat$sei <- ((log(dat$Upper.CI)-dat$yi)/1.96)

dat$SE <- exp(dat$sei)

#calculate variance from SE
#variance = SE^2 * n
dat$vi <- ((dat$SE)^2)*(dat$N)

#calculate inverse variance
#inverse variance
dat$inv_vi <- 1/dat$vi


#load ggplot2
library(ggplot2)

#plot log(HR) largest study by log(HR) random effects estimate
logplotcolor <- qplot(x=dat$yi, y=dat$largeyi, data=dat, color=Outcome, 
      xlab="log(HR) Random Effects", ylab="log(HR) Largest Study",
      main= "Largest Study HR vs. Random Effects") + 
  geom_abline(slope=1, intercept = 0) 

logplotcolor + scale_color_brewer(palette="Blues") + theme_bw()

#plot log(HR) largest study by log(HR) random effects estimate without color coded outcomes
logplot <- qplot(x=dat$yi, y=dat$largeyi, data=dat,
                 xlab="log(HR) Random Effects", ylab="log(HR) Largest Study",
                 main= "A - Largest Study HR vs. Random Effects") + 
  geom_abline(slope=1, intercept = 0) 

logplot + theme_bw() + geom_point(color="lightskyblue3")


#plot inverse variance by the random effects summary estimate
invplotcolor <- qplot(x=dat$inv_vi, y=dat$HR, color=Outcome, 
      data=dat,
      xlab="Inverse Variance", 
      ylab="Random Effects Estimate HR", 
      main= "Random Effects HR Estimate vs. Inverse Variance") + 
  coord_cartesian(ylim = c(-5, 15)) + geom_abline(slope=0, intercept = 1) 

invplotcolor + scale_color_brewer(palette="Blues") + theme_bw()

#plot inverse variance by the random effects summary estimate without color coded outcomes
invplot <- qplot(x=dat$inv_vi, y=dat$HR, 
                 data=dat,
                 xlab="Inverse Variance", 
                 ylab="HR", 
                 main= "B - HR Estimate vs. Inverse Variance") + 
  coord_cartesian(ylim = c(-5, 15)) + geom_abline(slope=0, intercept = 1) 

invplot + theme_bw() + geom_point(color="lightskyblue3")

#make Site categorical to bin by site on boxplot x axis
dat$Site <- as.character(dat$Site)
typeof(dat$Site)
typeof(dat$HR)


#create boxplot in ggplot2
boxsite <- ggplot(data=dat, aes(x=Site, y=HR)) + 
  geom_boxplot(color="dodgerblue4", fill="lightskyblue3", outlier.color = NA, 
               alpha=0.5 ) + coord_cartesian(ylim = c(0, 5)) + geom_jitter(alpha = 0.5, color = "lightskyblue3") + 
  ggtitle("C - Box plot of HR and cancer site") + theme_bw() + theme(plot.title = element_text(hjust=0.5))

boxsite

#create boxplot in ggplot2
boxout <- ggplot(data=dat, aes(x=Outcome, y=HR)) + 
  geom_boxplot(color="dodgerblue4", fill="lightskyblue3", outlier.color = NA, 
               alpha=0.5 ) + coord_cartesian(ylim = c(0, 5)) + geom_jitter(alpha = 0.5, 
                                          color = "lightskyblue3") + ggtitle("D - Box plot of HR and cancer outcome") + theme_bw() + theme(plot.title = element_text(hjust=0.5))
boxout

library(gridExtra)

#join keys figures in single figure
figures <- grid.arrange(logplot + geom_point(color = "dodgerblue4") + theme_bw() + theme(plot.title = element_text(hjust=0.5)), 
             invplot + geom_point(color = "dodgerblue4") + theme_bw() + theme(plot.title = element_text(hjust=0.5)), 
             boxsite, boxout)

figures


#create bar chart of the number of studies per site, 
#with indicators for the outcomes measured
counts <- ggplot(dat, aes(Site), main="Characterists of Included Meta-analyses")

counts + geom_bar(aes(fill = Outcome)) + 
  scale_fill_brewer(palette="Blues") + theme_bw() # use brewer color palettes

#histogram of pvals for significance, eggers test and Q test
#back transform 95% CIs to find standard error
#SE = [Log(U)-Log(HR)]/1.96
dat$sei <- ((log(dat$Upper.CI)-dat$yi)/1.96)

#calculating p values
dat$z <- (dat$yi/dat$sei)
dat$pval <- (1 - pnorm(abs(dat$z))) * 2

#plot a histogram of pvals for significance
#hist(dat$pval)

#is p value significant?
dat$sig_O <- dat$pval < 0.05

#tabulate the observed number of significant individual studies
table(dat$sig_O) [TRUE]

#calculate the number of studies examining each outcome
dat$CSS <- dat$Outcome=="CSS" #5
table(dat$CSS) [TRUE]
dat$DFS <- dat$Outcome=="DFS" #11
table(dat$DFS) [TRUE]
dat$OS <- dat$Outcome=="OS" #41
table(dat$OS) [TRUE]
dat$PFS <- dat$Outcome=="PFS" #14
table(dat$PFS) [TRUE]
dat$RFS <- dat$Outcome=="RFS" #10
table(dat$RFS) [TRUE]

