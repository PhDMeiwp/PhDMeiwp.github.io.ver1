---
title: 'basicANCOVA, an R package for Onw-way ANCOVA Judgement and Plot'
date: 2018-04-08 14:39:17
category: R
tags: [ANCOVA; R package]
---

---

[Github](https://github.com/PhDMeiwp/basicANCOVA)

[![HitCount](http://hits.dwyl.io/PhDMeiwp/basicANCOVA.svg)](http://hits.dwyl.io/PhDMeiwp/basicANCOVA)


{% asset_img Fig.slope1.png Fig.slope1.png %}

<!-- more -->


## Installation (1.0.1)

**version 1.0.1** from Github

    ### version 1.0.1
	
	install.packages("devtools")
	library(devtools)   
	install_github("PhDMeiwp/basicANCOVA@master", force = TRUE)
	library(basicANCOVA)



## Usage

    ANCOVAplot(x, y, groups,data, 
       			col=1:length(levels(groups)),
       			pch=1:length(levels(groups)),
       			lty=1:length(levels(groups)),
       			legendPos="topleft",
       			...)


# Examples
	

    library(basicANCOVA)
    data("isotope",package = "basicANCOVA")
    View(isotope)
    #rename
    groups<-isotope$area
    x<-isotope$d13C
    y<-isotope$d15N
    data<-isotope
    
    ANCOVAplot(x,y,groups,data)


---

<span id="busuanzi_container_page_pv">
PageViews: <span id="busuanzi_value_page_pv"></span> times
</span>

---

① This article represents the author's personal point of view, does not represent any other position!

② Feel free to cite or share this article but please specify：The original URL of this article is http://meiweiping.cn