---
title: RでANCOVAを正しく実行する
date: 2017-03-09 09:50:38
category: R
tags: [R, ANCOVA, type I, type III]
---

簡単に言えば、共分散分析（ANCOVA）は、R言語でy~x + / * y0として表され、ここで変数はyであり、共変量はy0であり、独立変数はxである。

そして、Rコードを進みましょう。

<!-- more -->

``` bash
data.of.Wada2013.practice <- read.csv("~data of Wada2013 practice.csv")

View(data.of.Wada2013.practice)

eco<-data.of.Wada2013.practice 

eco
```

\     site  d13C  d15N

1\.     1 -28.40  4.05

2\.     1 -26.90  6.70

3\.     1 -25.90  7.30

4\.     1 -25.85  7.85

5\.     1 -25.60  9.90

6\.     1 -26.35  10.30

7\.     1 -26.25  10.70

8\.     1 -26.55  12.20

9\.     1 -26.60  12.65

10\.      1 -26.50  13.25

11\.      1 -26.40  13.70

12\.      1 -24.90  14.10

13\.      2 -24.00   9.02

14\.      2 -23.50  11.80

15\.      2 -22.71 15.78

16\.      2 -22.10 15.10

17\.      2 -20.50 14.00

18\.      2 -19.75 17.30

19\.      2 -20.35 17.95

20\.      3 -23.80  3.95

21\.      3 -23.50  4.80

22\.      3 -23.80  5.20

23\.      3 -23.70  6.10

24\.      3 -22.80  6.95

25\.      3 -21.95  7.10


``` bash
attach(eco)

sitef<-factor(eco$site)
```

<font color=red>#Step1: InterActionを使用したANCOVA</font>

``` bash
mod.IA<-aov(d15N~d13C*sitef,data=eco,  contrasts=list(sitef=contr.sum))
```

<font color=darkgreen>注意, aov() function, "contr.sum" for factor "sitef"(not  numerical "site")</font>

``` bash
summary(mod.IA)   # このsummary　は違う、type Iの結果が出で来るので、実はtype IIIの結果を求める!
```

``` bash
library(car)

Anova(mod.IA,type=3)           #正しいです. Anova() function, not anova
```

**Anova Table (Type III tests)**

Response: d15N

\           Sum Sq       Df           F value      Pr(>F) 

(Intercept)  70.098        1            13.0456   0.001858 **

<font color=red>d13C</font>           43.563       1             8.1073    <font color=red>0.010302 *</font>

sitef            3.341         2           0.3109      0.736451  

<font color=red>d13C:sitef</font>   1.771        2             0.1648     <font color=red>0.849262</font>

Residuals   102.093      19                    


Signif. codes:  0 *** ,0.001 ** ,0.01 * ,0.05 . ,0.1 ,  1



<font color=blue> **共変量d13C** はd15N と<font color=red>**有意に**</font> 変わっている( p = 0.001858),

それと共に **d13C:sitef** は<font color=red>有意に</font>変わっていること**ではありません**  ( p = 0.849262 ),</font>

------->   <font color=red>上記の2つの条件を同時に満たすために、次のANCOVAを実行し続けることができます。</font>

---

 <font color=red> Step2: NonInterActionを使用したANCOVA, 同じ形を求めるため, type III結果です。</font>

``` bash
 mod.NIA<-aov(d15N~d13C+sitef,data=eco,contrasts = list(sitef=contr.sum))

Anova(mod.NIA, type=3)
```

**Anova Table (Type III tests)**

Response: d15N

\              Sum Sq     Df      F value      Pr(>F)  

(Intercept)   117.10       1        23.677     8.232e-05 ***

d13C              74.32       1         15.027     0.0008727 ***

<font color=red>sitef</font>               258.75     2         26.158     <font color=red>1.989e-06 ***</font>

Residuals      103.86     21                      

Signif. codes:  0 ***, 0.001 **, 0.01 *, 0.05 ., 0.1 ,  1

pの値は8.232e-05 ***である、 切片は　0と有意に違います。


``` bash
summary.lm(mod.NIA)
```

Call:

aov(formula = d15N ~ d13C + sitef, data = eco, contrasts = list(sitef = contr.sum))

Residuals:

   Min        1Q          Median       3Q          Max

-3.6695    -1.5658      0.1179     1.1474    3.5577 

Coefficients:

\              Estimate        Std. Error     t value       Pr(>|t|)

(Intercept)   49.51511         0.1760       4.866       8.23e-05 ***

d13C            1.6545              0.4268        3.876      0.000873 ***

sitef1           4.3049             1.2335        3.490       0.002183 **

sitef2            1.0468             1.0774        0.972       0.342273

Signif. codes:  0 ***, 0.001 **, 0.01 *, 0.05 ., 0.1 ,  1

Residual standard error: 2.224 on 21 degrees of freedom

Multiple R-squared:  0.7556,    Adjusted R-squared:  0.7207

F-statistic: 21.65 on 3 and 21 DF,  p-value: 1.252e-06


<font color=darkgreen>上記に基づいて、Wada_2013のデータシートに適した3つのサイトの共通傾きと共通切片を持つ等式を得ることができます: <font color=red>d15N=1.6545[±0.4268]*d13C+49.51511[±0.1760 ]+[ecosystem specific sites constant] ( p = 0.000873).</font></font>



<font color=red> Step3: NonInterActionとtreatment contrastsを使用したANCOVA , type Iの結果です。</font>

``` bash
mod.NIA.tc<-aov(d15N~d13C+sitef,data=eco,contrasts = list(sitef=contr.treatment))

summary.lm(mod.<font color=red>NIA</font>.tc)          #正しいです,共通傾きと違う切片をもつグラフを作るため、type Iの結果が必要です。
```

Call:

aov(formula = d15N ~ d13C + sitef, data = eco, contrasts = list(sitef = contr.treatment))

Residuals:

  Min          1Q          Median      3Q           Max

-3.6695     -1.5658     0.1179      1.1474    3.5577 

Coefficients:

 \                   Estimate     Std. Error      t value       Pr(>|t|)    

(Intercept)         53.8200         11.2645       4.778      0.000101 ***

d13C                  1.6545           0.4268         3.876      0.000873 ***

sitef2                  -3.2581          2.1947        -1.485     0.152529    

sitef3                 -9.6567           1.7256        -5.596     1.49e-05 ***


Signif. codes:  0 ***, 0.001 **, 0.01 *, 0.05 ., 0.1 ,  1

Residual standard error: 2.224 on 21 degrees of freedom

Multiple R-squared:  0.7556,    Adjusted R-squared:  0.7207

F-statistic: 21.65 on 3 and 21 DF,  p-value: 1.252e-06


<font color=darkgreen>上記に基づいて、Wada_2013のデータシートに適した共通傾きと各サイトの切片を持つ等式を得ることができます: 

site1: d15N=1.6545*d13C+53.8200 ;

site2: d15N=1.6545*d13C+53.8200-3.2581 ;

site1: d15N=1.6545*d13C+53.8200-9.6567 . </font>


<font color = red >Step4: グラフを作る</font>

``` bash
dat1<-subset(eco,sitef == "1")                  

dat2<-subset(eco,sitef == "2")

dat3<-subset(eco,sitef=="3")

reg1<-lm(d15N~d13C,data=dat1)

reg2<-lm(d15N~d13C,data=dat2)

reg3<-lm(d15N~d13C,data=dat3)

plot(d15N~d13C,type="n")        # type="n" means plot with axes,without any plots.

points(dat1$d13C,dat1$d15N,pch=1)

points(dat2$d13C,dat2$d15N,pch=2)

points(dat3$d13C,dat3$d15N,pch=3)

abline(reg1,lty=1)

abline(reg2,lty=2)

abline(reg3,lty=3)

legend("topleft",c("L.Baikal","L.Biwa","Mongolian grassland"),lty=c(1,2,3),pch=c(1,2,3))
```

<font color=darkgreen>上記の手順では、違い傾きを持つグラフを出力します。<font color=red>graph</font></font>

<img src="http://image.sciencenet.cn/album/201605/08/093647kxpv96lwvm5xh6kz.jpg" width=90% align=center/>


``` bash
summod.NIA.tc<-summary.lm(mod.NIA.tc)       # type I

coeffs.NIA.tc<-coef(summod.NIA.tc)

coeffs.NIA.tc
```


 \                      Estimate           Std. Error         t value            Pr(>|t|)

(Intercept)      53.820034         11.2645326    4.777831       1.014464e-04

d13C              1.654461           0.4268016      3.876416        8.726695e-04

sitef2             -3.258098          2.1947260     -1.484512       1.525294e-01

sitef3             -9.656707          1.7255811      -5.596206      1.488283e-05

``` bash
I1<-coeffs.NIA.tc[1,1]

I2<-coeffs.NIA.tc[3,1]+I1

I3<-coeffs.NIA.tc[4,1]+I1

solpeAll<-coeffs.NIA.tc[2,1]

plot(d15N~d13C,type="n")

points(dat1$d13C,dat1$d15N,pch=1)

points(dat2$d13C,dat2$d15N,pch=2)

points(dat3$d13C,dat3$d15N,pch=3)

abline(I1,slopeAll,lty=1)

abline(I2,slopeAll,lty=2)

abline(I3,slopeAll,lty=3)
```


<font color=darkgreen>とりわけ、なぜsummary.lm（mod.NIA）をグラフに使用できないのかを明確に理解することができました。</font>

``` bash
legend("topleft",c("L.Baikal","L.Biwa","Mongolian grassland"),lty=c(1,2,3),pch=c(1,2,3))
```

<img src="http://image.sciencenet.cn/album/201605/08/0948374dyyxbtyy5jxb5t5.jpg" width=90% align=center/>

以上^_^



---

<span id="busuanzi_container_page_pv">
<span id="busuanzi_value_page_pv"></span> 回目読む
</span>