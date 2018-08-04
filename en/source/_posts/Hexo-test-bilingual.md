---
title: Hexo test bilingual
date: 2017-03-13 11:15:39
category: Hexo
tags: 
---



I am truly thank the share link of [[chenymr's website]](http://chenyxmr.github.io/2016/08/04/hexo-bilingual/) for his introductions about how to built a bilingual website based on Hexo.


The detials please find in his [origianl post](http://chenyxmr.github.io/2016/08/04/hexo-bilingual/) written in Chinese, here, I just want to highlight something from that post.

<!-- more -->


**1st**, there are <font color=red>two dots</font> before <font color=red>"/public/en"</font> when we run the following codes:

    
     Modify files in  /en/_config.yml as follows：

>language: en </br>
>root: /en/  </br>
>public_dir: ../public/en  </br>


**2nd**, there are also <font color=red>two dots</font> before <font color=red>"commonweal:"</font> when we run the following codes:


      Next, add entrance for 中文版 in English website, you need edit files in /en/_config.yml, and add one command in menu: as follows：

>中文版: ../


BTW, the "/update.bat" is friendly worked for the bilingual case. Thanks again to [[陈年沉念]](http://chenyxmr.github.io/2016/08/04/hexo-bilingual/).



<img src="https://i.loli.net/2017/08/24/599e7ec5a3b4d.gif" align=center>


----

Ignore the following part.

转载来源： https://chenyxmr.github.io/2016/08/04/hexo-bilingual/

前言
搭建个人博客时采用的hexo非常方便，但由于本人比较喜欢英语所以希望能搭建一个双语网站同步更新内容，hexo官方有提供国际化解决方案，具体参见链接https://hexo.io/zh-cn/docs/internationalization.html 。 但本人由于悟性比较低没有看明白这个插件应该怎么用，就索性自己用一个非常简单粗暴的方式实现了中英文双语网站。

首先，最终效果见本站。菜单栏中点击->English切换到英文网站，英文网站中点击->简体中文即切换回中文。当然每篇博文都需要自己翻译。

搭建教程
完整复制网站

首先，将网站根目录全部复制，然后在网站根目录下建立en/文件夹并将所复制的内容粘贴至此。此时en/文件夹下有一份完整的网站文件，也就是说这是一个独立的hexo博客。


Modify file in /en/_config.yml as follows：

    language: en
    root: /en/
    public_dir: ../public/en

这里的public_dir代表最终生成静态文件的位置，由于最后要将英文网站静态网页跟中文静态网页放到同一根目录下，所以要进行修改。

添加语言切换入口

首先在中文网站中添加切换英文入口。语言切换入口对应网站的menu，编辑/_config.yml，修改menu:中如下内容：

    English version: /en


这个键值对应切换语言选项显示的内容。

接下来在英文网站中添加中文入口。编辑/en/_config.yml，修改menu:中如下内容：

    中文版: ../


至此中英文站点即配置完成,如果英文网站需要更改细节直接更改en/下对应的文件就可以，和修改中文网站完全一样~

新建博文

每次在中文站点下新建博文并写好后，将博文复制到英文网站对应的目录下并修改成英文博文。



---

<span id="busuanzi_container_page_pv">
PageViews: <span id="busuanzi_value_page_pv"></span> times
</span>

---

① This article represents the author's personal point of view, does not represent any other position!

② Feel free to cite or share this article but please specify：The original URL of this article is http://meiweiping.cn
