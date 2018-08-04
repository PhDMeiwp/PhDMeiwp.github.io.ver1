---
title: 'Steel.Dwass test in R: Kruskal-Wallis post hoc test'
date: 2017-03-15 16:04:50
category: Statistics
tags: [Steel.Dwass, Kurskal-Wallis, ANOVA, nunparametric, parametric]
---


**Kruskal-Wallis** test is a popular **nonparametric** ANOVA method , 

and its corresponding **post hoc analysis** or multiple comparison methods are rarely known by part of scientific researchers, 

<!-- more -->

now we <font color=red>**recommend you try the Steel-Dwass test**.</font>


The pre-requisite for statistical analysis is very important and easy to be ignored, such as whether the data is normal distribution, whether the variance is homogeneous in multiple sets of data, etc., if your data meet the above conditions, parameter test will be OK, otherwise, use nonparametric test.

<img src="http://p1.bpimg.com/567571/2564e0d93f8aff2b.png" align=center>


For the parameter test case, Tukey's HSD test is common for post hoc test after 1-way ANOVA ; correspondingly, nonparametric test method of Steel Dwass test is a good choice for post hoc test after Kruskal wallis test. 

BTW, many high-IF SCIs' editors seem to recommend Steel Dwass test for non-parametric Kruskal wallis post hoc test, rather than others (e.g., Tamhane's T2 test).

---

<center>**OK, run Steel Dwass test in R or Rstudio.**</center>

**Purpose:**

Steel-Dwass test, a multiple comparison method after Kruskal-Wallis test.


**Instructions:**

Steel.Dwass(data, group)

**Data set:**

dat

group

**R codes are as follows:**

``` bash
# Steel-Dwass test

Steel.Dwass <- function(data,             
                group)           
{        
   OK <- complete.cases(data, group)      
  data <- data[OK]    
  group <- group[OK]    
  n.i <- table(group)           
  ng <- length(n.i)  
   t <- combn(ng, 2, function(ij) {
         i <- ij[1]      
         j <- ij[2]          
         r <- rank(c(data[group == i], data[group == j]))    
         R <- sum(r[1:n.i[i]])                
         N <- n.i[i]+n.i[j]      
         E <- n.i[i]*(N+1)/2                
         V <- n.i[i]*n.i[j]/(N*(N-1))*(sum(r^2)-N*(N+1)^2/4)  
         return(abs(R-E)/sqrt(V))           
   })    

    p <- ptukey(t*sqrt(2), ng, Inf, lower.tail=FALSE)  # calculate P-value    
     result <- cbind(t, p)                  
    rownames(result) <- combn(ng, 2, paste, collapse=":")    
    return(result)
}
```


**Examples:**

``` bash

data <- c(
6.9, 7.5, 8.5, 8.4, 8.1, 8.7, 8.9, 8.2, 7.8, 7.3, 6.8, # 11 data

9.6, 9.4, 9.5, 8.5, 9.4, 9.9, 8.7, 8.1, 7.8, 8.8,    # 10 data

5.7, 6.4, 6.8, 7.8, 7.6, 7.0, 7.7, 7.5, 6.8, 5.9,    # 10 data

7.6, 8.7, 8.5, 8.5, 9.0, 9.2, 9.3, 8.0, 7.2, 7.9, 7.8  # 11 data)

group <- rep(1:4, c(11, 10, 10, 11))    

Steel.Dwass(data, group)
```


**Output:**

> Steel.Dwass(data, group)

>      |      t         |       p

>1:2   |   2.680234     |  0.036960431

>1:3   |   2.539997     |   0.053980573

>1:4   |   1.282642     |   0.574011771

>2:3   |   3.746076     |   0.001031145

>2:4   |  2.046776      |   0.170965537

>3:4   |   3.384456     |   0.003976894

---

<center>**Q & A**</center>

**Citations:**  http://aoki2.si.gunma-u.ac.jp/R/Steel-Dwass.html


---

<span id="busuanzi_container_page_pv">
PageViews: <span id="busuanzi_value_page_pv"></span> times
</span>

---

① This article represents the author's personal point of view, does not represent any other position!

② Feel free to cite or share this article but please specify：The original URL of this article is http://meiweiping.cn