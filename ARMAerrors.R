# Add Your Excel File Path Here
XLPATH = 'C:\\Users\\brecp1\\Downloads\\USDemandModelData.xls'

######################################
# Method 1
######################################
library(readxl)

data <- read_excel(XLPATH,sheet=1)
y = data[,'MGFUPUS2']
#ymean = mean(data$MGFUPUS2)
x = data[,c('RetailPrices','mpg')]

fit <- arima(y, xreg=x, order=c(0,0,0), seasonal=list(order=c(0,0,1), period=12), method = c("CSS-ML"))
fit

######################################
# Method 2
######################################
library(astsa)

fit2 <- sarima(y,0,0,0,0,0,1,12, xreg=x)
fit2

######################################
# Method 3
######################################
stats::arima(x=y,order=c(0,0,0), seasonal=list(order=c(0,0,1), period=12), xreg=x, include.mean =TRUE, method="ML") 



library(astsa)

xerie = scan("C:\\Users\\brecp1\\R\\data\\eriedata.dat") #reads the data
xerie = ts (xerie) # makes sure xerie is a time series object
plot (xerie, type = "b") # plots xerie
acf2 (xerie) # author’s routine for graphing both the ACF and the PACF
sarima (xerie, 1, 0, 0) # this is the AR(1) model estimated with the author’s routine
sarima (xerie, 0, 0, 1) # this is the incorrect MA(1) model
sarima (xerie, 1, 0, 1) # this is the over-parameterized ARMA(1,1) model 



######################################
# Compare to Python
######################################
# cmort, part, tempr are all data in the astsa package

trend = time(cmort)
temp = tempr - mean(tempr)
temp2 = temp**2
reg_data = data.frame(trend,temp,temp2,part)

fit3 <- sarima(cmort,2,0,0, xreg=reg_data)
fit3


# Export
df1 = cbind(cmort, part, tempr)
df2 = data.frame(as.matrix(df1), date=time(df1))
path <- "C://Users//brecp1//R//data//cmort.csv"
write.csv(df2, path)

# Python code
#trend = df.date
#temp = df.tempr - df.tempr.mean()
#temp2 = temp**2
#part = df.part
#reg_data = pd.concat([trend, temp, temp2, part], axis=1)
#reg_data.columns = ["trend", "temp", "temp2", "part"]
#exog = sm.add_constant(reg_data)
#fit = sm.tsa.SARIMAX(df.cmort, exog=exog, order=(2, 0, 0)).fit(maxiter= 10000, method='nm')
#print(fit.summary())



