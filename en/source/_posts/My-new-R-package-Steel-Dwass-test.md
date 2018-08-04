---
title: My new R package: Steel.Dwass.test
date: 2017-11-09 14:56:22
category: R
tags: [R, Steel.Dwass.test]
---

---




> Now everybody can ues R package named Steel.Dwass.test! See how to install it: [Click here](https://github.com/PhDMeiwp/Steel.Dwass.test).


- Reference：Steel, R.G.D. (1961). Some rank sum multiple comparison tests. Biometrics 17, 539-552.

<!-- more -->


---

# Installing Steel.Dwass.test package in R

You can install directly from GitHub if you have the devtools package installed:
    
    install.packages("devtools")
    library(devtools)  
    install_github("PhDMeiwp/Steel.Dwass.test@master", force = TRUE)
    library(Steel.Dwass.test)

Then upload your dataset including x and group data, for example

     x <- c(6.9, 7.5, 8.5, 8.4, 8.1, 8.7, 8.9, 8.2, 7.8, 7.3, 6.8,9.6, 9.4, 9.5, 8.5, 9.4, 9.9, 8.7, 8.1, 7.8, 8.8,5.7, 6.4, 6.8, 7.8, 7.6, 7.0, 7.7, 7.5, 6.8, 5.9,7.6, 8.7, 8.5, 8.5, 9.0, 9.2, 9.3, 8.0, 7.2, 7.9, 7.8)
	 group <- rep(1:4, c(11, 10, 10, 11))

and run

		Steel.Dwass(x,group)

To see examples on how to use Steel.Dwass.test in R software, you can run the following R code if you have the Steel.Dwass.test package installed:

	library(Steel.Dwass.test)
    ?Steel.Dwass

# Acknowledgments

Thanks to DLMcArthur for help with R code improvement tips!





---

<span id="busuanzi_container_page_pv">
PageViews: <span id="busuanzi_value_page_pv"></span> times
</span>

---

① This article represents the author's personal point of view, does not represent any other position!

② Feel free to cite or share this article but please specify：The original URL of this article is http://meiweiping.cn