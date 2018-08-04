---
title: R package of Steel.Dwass.test is available
date: 2017-11-09 15:28:23
category: R
tags: [R]
---

The Steel.Dwass.test package is build in github, and you can install it into your R software now.

How to install it? [Click here](https://github.com/PhDMeiwp/Steel.Dwass.test).


<!-- more -->

---

# Steel.Dwass.test v1.0.0

Steel, R.G.D. (1961). Some rank sum multiple comparison tests. Biometrics 17, 539-552.

R code source coming from http://aoki2.si.gunma-u.ac.jp/R/Steel-Dwass.html

## Installing Steel.Dwass.test package in R

You can install directly from GitHub if you have the devtools package installed:

    library(devtools)   # or install.packages("devtools")
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


## Acknowledgments

Thanks to [DLMcArthur](https://disqus.com/by/dlmcarthur/) for help with R code improvement [tips](https://meiweiping.github.io/Steel-Dwass-test-in-R-Kruskal-Wallis-post-hoc-test/#comments)!


---

<span id="busuanzi_container_page_pv">
PageViews: <span id="busuanzi_value_page_pv"></span> times
</span>

---

① This article represents the author's personal point of view, does not represent any other position!

② Feel free to cite or share this article but please specify：The original URL of this article is http://meiweiping.cn