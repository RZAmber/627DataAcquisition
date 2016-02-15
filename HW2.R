# @Rui Zhang HW2

getwd()
setwd("~/SIT/2016S/627/627DataAcquisition/")
#Q2
file.choose()
Data2=read.csv("/Users/apple/SIT/2016S/627/week/week4/hw2/Q2.csv",header=TRUE)
lag<-100
par(mfrow=c(2,1))
acf(Data2[,2],lag.max=lag,plot=TRUE,main="Q2data ACF")
pacf(Data2[,2],lag.max=lag,plot=TRUE,main="Q2data PACF")
#Q3
file.choose()
Data3=read.csv("~/SIT/2016S/627/week/week4/hw2/Q3.csv",header = TRUE)
par(mfrow=c(2,1))
acf(Data3[,1],lag.max=lag,plot=TRUE,main="Q3data ACF")
pacf(Data3[,1],lag.max=lag,plot=TRUE,main="Q3data PACF")

#Q2 residuals
tt<-arima(Data2,c(0,0,4))
par(mfrow=c(2,1))
acf(tt$residuals,main="Data2 ACF Residuals")
pacf(tt$residuals,main="Data2 PACF Residuals")

#Q3 residuals
tt<-arima(Data3,c(4,1,0))
par(mfrow=c(2,1))
acf(tt$residuals,mian="Data3 ACF Residuals")
pacf(tt$residuals,mian="Data3 PACF Residuals")