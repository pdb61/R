library(astsa)
library("xlsx")

data(soi)
data(rec)

df = data.frame('soi'=soi, 'rec'=rec)

write.csv(df, "c:\\Users\\brecp1\\soirec.csv", row.names=FALSE)