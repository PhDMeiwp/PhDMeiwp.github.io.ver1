---
title: Install data.table successfully in R version 3.5.0
date: 2018-04-26 22:31:14
category: R
tags: [data.table]
---

---

Install data.table successfully in R version 3.5.0.

Reference is [here](https://stackoverflow.com/questions/49838553/data-table-package-in-r-3-5-does-not-install).

<!-- more -->

##Step 1： download .zip file##

Follow some steps in the image below, go to [here](https://github.com/Rdatatable/data.table/wiki)to download the "data.table_1.10.5.zip" to your R PATH (default is C:/Users/yourPCname/Documents/).

{% asset_img click.jpg click.jpg %}

Tips：if the .zip file download from the（1）positon in the above image failed to install data.table, then try the other one in the（2）position in the above image.

##Step 2：Install data.table##

Launch R software (not Rstudio!), run the following R codes，

	install.packages("~/data.table_1.10.5.zip")

if output messages as: package ‘data.table’ successfully unpacked and MD5 sums checked, congratulations, you'r successfully install data.table.

	library(data.table)

run library(data.table) to confirm again. 

if output messages as: package ‘data.table’ was built under R version 3.6.0 , OK, of course, it's available under R version 3.5.0.

{% asset_img Rcode.jpg Rcode.jpg %}

Best wishes.


---

<span id="busuanzi_container_page_pv">
PageViews: <span id="busuanzi_value_page_pv"></span> times
</span>

---

① This article represents the author's personal point of view, does not represent any other position!

② Feel free to cite or share this article but please specify：The original URL of this article is http://meiweiping.cn