---
title: Rでy=a*exp(b*x)+cのselfStart-function
date: 2017-11-26 14:09:21
category: R
tags: [非線形回帰, R]
---

---


Weiping Mei < meiweipingg@gmail.com >


<!-- more -->


    # selfStart method for
    # y = a *exp(b*x)+ c

    expModel<-function(predictor,a,b,c){a*exp(b*predictor)+c}  #モデルに対応するfunctionを定義する。
  
  	expModelInit <- function(mCall,LHS, data)
  	{
    xy <- sortedXyData(mCall[["predictor"]],LHS, data)
    y=xy[,"y"]
    x=xy[,"x"]
    adjy=y-min(y)+1
    xadjy=data.frame(x,adjy)
    
    lmFit <- lm(log(adjy) ~ x)
    coefs <- coef(lmFit)
    get.b <- coefs[2]   #slope
  
    nlsFit<-nls(adjy~cbind(1+exp(b*x),exp(b*x)),
                start = list(b=get.b),data = xadjy,algorithm = "plinear",
                nls.control(maxiter = 5000000,minFactor = 10^(-10)))
    
    coef<-coef(nlsFit)
    b<-coef[1]
    c<-coef[2]+min(y)-1
    a<-coef[3]+coef[2]

    value <- c(a,b,c)
    names(value) <- mCall[c("a","b","c")]
    value
    }
  
    SSexp3P<-selfStart(expModel,expModelInit,c("a","b","c"))
  
    # getInitial(y~SSexp3P(x,a,b,c),data = z)
 

次に、式 "y = a \ * exp（b \ * x）+ c"の各パラメータの正確な値を取得するために、 Rで"SSexp3P"というselfStart function を実行できます：

	x<-1:5
	y<-c(2,14,16,18,19)
	z<-data.frame(x,y)

	fitexp3Pss<-nls(y~SSexp3P(x,a,b,c),data=z)
	fitsum <- summary(fitexp3Pss)   # 各パラメータの正確な値を得た。
	fitsum




---

<span id="busuanzi_container_page_pv">
<span id="busuanzi_value_page_pv"></span> 回目読む
</span>