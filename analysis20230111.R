MAXdata <- read.csv("MAXylipinsXY.csv")
library(tidyverse)

## For OGTT experiment, compare baseline oxylipin levels (GTT0) between T2D and NGT. 
# subset rows containing GTT0 
GTT0_T2D_vs_NGT <- filter(MAXdata, Condition == "GTT0")

# Run Shapiro-wilk normality test on X11_HDoHE
with(GTT0_T2D_vs_NGT, shapiro.test(X11_HDoHE[Health == "T2D"]))
with(GTT0_T2D_vs_NGT, shapiro.test(X11_HDoHE[Health == "NGT"]))

#Run F test to test homogeneity of variance with on X11_HDoHE
res.ftest <- var.test(X11_HDoHE ~ Health, data = GTT0_T2D_vs_NGT)
res.ftest

#Shapiro-Wilk test significant, run Mann-Whitney U test
wilcox.test(X11_HDoHE~Health, data = GTT0_T2D_vs_NGT, exact = FALSE)

