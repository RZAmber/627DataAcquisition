# @Rui Zhang HW2

getwd()
setwd("~/SIT/2016S/627/627DataAcquisition/")
#Q2
file.choose()
Data2=read.csv("/Users/apple/SIT/2016S/627/week/week4/hw2/Q2.csv",header=TRUE)
# plot the origin data with time
a1<-ts(Data2) # creat time-series objects
plot(a1,xlab="time",ylab="data2",main="Data2") 
#acf and pacf
lag<-100
par(mfrow=c(2,1))
acf(Data2[,1],lag.max=lag,plot=TRUE,main="Q2data ACF")
pacf(Data2[,1],lag.max=lag,plot=TRUE,main="Q2data PACF")


#Q2 residuals
t21<-arima(Data2,c(8,0,0)) % AR(8)
t22<-arima(Data2,c(0,0,3)) % MA(3)
par(mfrow=c(2,1))
acf(t21$residuals,main="Data2 AR(8) Residuals")
acf(t22$residuals,main="Data2 MA(3) Residuals")
# get cofficients
arima(Data2,order=c(0,0,3),method='ML')


#Q3
file.choose()
Data3=read.csv("~/SIT/2016S/627/week/week4/hw2/Q3.csv",header = TRUE)
a2<-ts(Data3) # creat time-series objects
par(mfrow=c(2,1))
plot(a2,xlab="time",ylab="data3",main="Data3",lwd=2) 
dd<-a2[2:1250]-a2[1:1249] # make the difference 1, try to get stable data
plot(dd,xlab="time",ylab="dif",main="dif of data3",type='l',col='red')
lag<-100
dev.new() #creat new window to plot
par(mfrow=c(2,1))
acf(Data3[,1],lag.max=lag,plot=TRUE,main="Q3data ACF")

#check the difference
ar_fit<- ar(Data3, order.max=2)
dev.new()
par(mfrow=c(2,1))
acf(ar_fit$resid[2:1249],main="difference ACF")
pacf(ar_fit$resid[2:1249],main="difference PACF")	

#Q3 residualsd
dev.new()
t3<-arima(Data3,c(4,1,2)) #经过试验
par(mfrow=c(2,1))
acf(t3$residuals,main="Data3 ACF Residuals")
pacf(t3$residuals,main="Data3 PACF Residuals")
# get cofficients
arima(Data3,order=c(4,1,2),method='ML')