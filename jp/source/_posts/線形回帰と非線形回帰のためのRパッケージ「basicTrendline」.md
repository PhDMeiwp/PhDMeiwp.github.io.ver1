---
title: 線形回帰と非線形回帰のためのRパッケージ「basicTrendline」
date: 2017-12-18 10:40:54
category: R
tags: [R, 線形回帰, 非線形回帰, basicTrendline]
---

---


# basicTrendline


Rパッケージ「basicTrendline」は <font color=red>回帰パラメータを出力とともに、プロットと回帰直線を1ステップで直接実行できます。</font>

> Rパッケージ「basicTrendline」をチェックしたところ、Rパッケージ「basicTrendline」の出力結果は商用ソフトウェアOriginProの出力結果と完全に同じである。

<font color=blue>特に、power functionを計算する時に、Rパッケージ「basicTrendline」は、商用ソフトウェアOriginProの出力結果より良い結果を得ることができます。</font>

<!-- more -->

## Rに「basicTrendline」パッケージをインストールする

1\. Rで直接にインストールする

	install.packages("basicTrendline")
	library(basicTrendline)

2\. devtoolsパッケージがインストールされている場合、GitHubから直接「basicTrendline」パッケージをインストールすることができます：

    install.packages("devtools")
	library(devtools)   
	install_github("PhDMeiwp/basicTrendline@master", force = TRUE)
	library(basicTrendline)


## 「basicTrendline」パッケージの使い方
	
まず、xとyのデータを含むデータセットをアップロードします。

    x<-c(1,30,90,180,360)
    y<-c(4,8,10,11,11)

次に、

	library(basicTrendline)

	trendline(x,y,model="exp3P", summary=TRUE, eDigit=10, ePos="topleft",linecolor="red")  
	
同じ関数 "basicTrendline（）"を使って、他のモデルを変更することができます。モデル（model）の値は 'lin2P'、 'line3P'、 'log2P'、 'exp3P'　や 'power3P'　のいずれかです。
	
- "line2P"    # y=a\*x+b

- "line3P"    # y=a\*x^2+b\*x+c

- "log2P"     # y=a\*ln(x)+b

- "exp3P"     # y=a\*exp(b\*x)+c

- "power3P"   # y=a*x^b+c)


## Highlights

- The "basicTrendline" package in R software could output a better regression result (higher R-squared and lower p-value) for 'power3P' model（y = ax^b +c） than those in OriginPro software. Please see the example below:

>formula as y=a*x^b +c

x<- c(1,30,60,90,180,360)

y<- c(2,14,16,18,19,20)  # increase convex-function

>in OriginPro software:

c=-7344.578

a=7347.183

b=43224.4

<font color=red>adjR^2= 0.97129       # lower adjR^2 value</font>

p-value of model=2.24891e-4

>in the 'basicTrendline' R package:

c=34.671

a=-32.703

b=-0.13999

<font color=red>adjR^2= 0.99346 >  0.97129   # higher (or better ) adjR^2 value</font>

p-value of model= 2.44924-5 < 2.24891e-4


## グラフ

![line2P.png](https://i.loli.net/2017/12/20/5a39cf4954e69.png)
![line3P.png](https://i.loli.net/2017/12/20/5a39d001c5049.png)

![log.png](https://i.loli.net/2017/12/20/5a39cf4962808.png)
![log0.5.png](https://i.loli.net/2017/12/20/5a39cf4962781.png)

![exp.png](https://i.loli.net/2017/12/20/5a39cf495184e.png)
![power.png](https://i.loli.net/2017/12/20/5a39cf496566f.png)


To see examples on how to use "basicTrendline" in R software, you can run the following R code if you have the "basicTrendline" package installed:
Rソフトウェアで 「basicTrendline」パッケージの使い方の例を見るには、 「basicTrendline」パッケージがインストールされている場合は、次のRコードを実行します。

    library(basicTrendline)
    ?trendline()


## 謝辞


- adding-regression-line-equation-and-r2-on-graph-1: http://blog.sciencenet.cn/blog-267448-1021594.html
- adding-regression-line-equation-and-r2-on-graph-2: https://stackoverflow.com/questions/7549694/adding-regression-line-equation-and-r2-on-graph
- What is non-linear regression?: https://datascienceplus.com/first-steps-with-non-linear-regression-in-r/
- adding regression line for nonlinear regression: http://blog.sciencenet.cn/blog-651374-1014133.html
- R codes for 'print.summary.nls of exp3P and power3P' cite from https://github.com/SurajGupta/r-source/blob/master/src/library/stats/R/nls.R
- ...



---

<span id="busuanzi_container_page_pv">
<span id="busuanzi_value_page_pv"></span> 回目読む
</span>