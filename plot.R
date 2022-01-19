
pdf(file="I:\\OTI\\market analysis\\Pete\\R\\R Class\\output\\UsingFunction.pdf", height=9, width=7.5)
par(mfrow=c(4,2), mar=c(2,3,3,2))

plot.d(d1,"BP.GAS.GOA.TOTAL.PA1.RUN.ALL.M.KBD")
plot.d(d2,"BP.REF.GOA.CRU.PA1.TAR.PLUNPLFC.W.KBD",type="w")

plot.d(d1,"BP.GAS.GOA.TOTAL.PA1.RUN.ALL.M.KBD", myTitle="Padd 1 Runs")
plot.d(d2,"BP.REF.GOA.CRU.PA1.TAR.PLUNPLFC.W.KBD",type="w", myTitle="Padd 1 TARs")

dev.off()
