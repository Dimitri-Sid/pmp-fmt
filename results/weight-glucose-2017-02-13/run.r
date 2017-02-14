# Generates boxplot of weight gain
# run from inside R with source('run.r')
# run from command line with Rscript run.r

# read data
x <- read.table('../../data/weight_glucose.txt',sep='\t',head=T)

# change the default ordering of the FMT source v. fiber factor
x$FMT_Source_Diet <- factor(x$FMT_Source_Diet, levels=c('Wild_HighFiber','Wild_LowFiber','Captive_HighFiber','Captive_LowFiber'),ordered=TRUE)

# make the boxplot
pdf("boxplot_weight.pdf",width=5,height=5)
# increase bottom margin
par(mar=c(8,4,2,2));

boxplot(x$Weight_Change_g ~ x$FMT_Source_Diet,cex.axis=.75,las=2,xlab='',ylab='')

# write x axis label farther down than normal
mtext('FMT Source and Diet',side=1,line=6.5)

# write y axis label closer in than normal
mtext('Weight change (g)',side=2,line=2)

dev.off()