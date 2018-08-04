---
title: Rで y=a+b*exp(c*x) の計算方法
date: 2017-10-06 14:55:18
category: R
tags: [nls, R]
---

---

等式は  y=a+ b\*e<sup>(c\*x)</sup>　である。

例えば、[同位体比のturnover timeを計算する場合](http://phdmeiwp.github.io/%E6%BA%90%E6%96%87%E7%8C%AE%E7%B4%A2%E5%BC%95%E7%B3%BB%E5%88%97%E4%B9%8B%E7%A8%B3%E5%AE%9A%E5%90%8C%E4%BD%8D%E7%B4%A0%E7%AF%87/)：  

<font color=red> δ<sub>t</sub> = δ<sub>f</sub> + (δ<sub>i</sub> - δ<sub>f</sub>)e<sup>vt</sup>       </font> 

注意事項と　元のRコードは以下のURLを参照してください： http://blog.sciencenet.cn/blog-651374-1014133.html



<!-- more -->




---

<span id="busuanzi_container_page_pv">
<span id="busuanzi_value_page_pv"></span> 回目読む
</span>