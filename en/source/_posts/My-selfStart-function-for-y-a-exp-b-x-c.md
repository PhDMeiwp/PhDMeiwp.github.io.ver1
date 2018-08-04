---
title: My 'selfStart' function for y=a*exp(b*x)+c
date: 2017-11-26 14:09:21
category: R
tags: [nls, R]
---

---

# My 'selfStart' function for y=a\*exp(b\*x)+c in R software

## Weiping Mei < meiweipingg@gmail.com >



<!-- more -->


    # selfStart method for
    # y = a *exp(b*x)+ c

    expModel<-function(predictor,a,b,c){a*exp(b*predictor)+c}  #define a function that corresponds to mean model.
  
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
 

Then you can run selfStart function named "SSexp3P" to get the exact values of each parameters in formula "y=a\*exp(b\*x)+c" as follows:


	x<-1:5
	y<-c(2,14,16,18,19)
	z<-data.frame(x,y)

	fitexp3Pss<-nls(y~SSexp3P(x,a,b,c),data=z)
	fitsum <- summary(fitexp3Pss)   # Get the exact value of each parameter.
	fitsum




---

<span id="busuanzi_container_page_pv">
PageViews: <span id="busuanzi_value_page_pv"></span> times
</span>

---

① This article represents the author's personal point of view, does not represent any other position!

② Feel free to cite or share this article but please specify：The original URL of this article is http://meiweiping.cn