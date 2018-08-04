# 基于Hexo-landscape主题搭建多国语言版本的个人网站

[![HitCount](http://hits.dwyl.io/PhDMeiwp/PhDMeiwp.github.io.svg)](http://hits.dwyl.io/PhDMeiwp/PhDMeiwp.github.io)

## 一、作者

<img src="https://github.com/PhDMeiwp/PhDMeiwp.github.io/blob/hexo/Common_images/Mei_Logo.JPG" width="70"/>

Weiping MEI https://PhDMeiwp.github.io


Graduate School of Fisheries and Environmental Sciences, Nagasaki University


## 二、网站搭建攻略

>>>文末有彩蛋哦~~~

### （1）基本操作步骤

参考：[**小白独立搭建博客--Github Pages和Hexo简明教程**](https://my.oschina.net/ryaneLee/blog/638440)

landscape主题作者的[README.md文件链接](https://github.com/hexojs/hexo-theme-landscape/blob/master/README.md)


### （2）添加“不蒜子访客及访问量统计插件”

Jimxu的博文：hexo的landscape-plus主题

[不蒜子访客及访问量统计插件](http://jimxu.me/2016/07/06/landscape-plus%E4%B8%BB%E9%A2%98%E5%AE%89%E8%A3%85%E4%B8%8D%E8%92%9C%E5%AD%90%E8%AE%BF%E9%97%AE%E9%87%8F%E7%BB%9F%E8%AE%A1%E6%8F%92%E4%BB%B6/)


### （3）添加“Disqus最近评论支持”

M-x Chris-An-Emacser的博文：[为Hexo添加Disqus最近评论支持——以Landscape类主题为例](https://chriszheng.science/2015/09/13/Hexo-add-recent-comment/)


### （4）添加“返回顶部按扭”

SummerWinds的博文：[主题修改 之 返回顶部按扭](http://blog.meredith.net.cn/2015-02-13/Theme-Modified-Gotop/)，已确认适用于Hexo Landscape主题,但原文少了gotop.js的代码，特此补充如下。


gotop.js
``` bash
(function($){

	//Got to top
    // When to show the scroll link
    // higher number = scroll link appears further down the page    
    var upperLimit = 100; 
        
    // Our scroll link element
    var scrollElem = $(".icon-gotop");
    
    // Scroll to top speed
    var scrollSpeed = 500;

    // Show and hide the scroll to top link based on scroll position    
	scrollElem.hide();
    $(window).scroll(function () {             
        var scrollTop = $(document).scrollTop();        
        if ( scrollTop > upperLimit ) {
            $(scrollElem).stop().fadeTo(300, 1);  // fade back in            
        }else{        
            $(scrollElem).stop().fadeTo(300, 0);  // fade out
        }
    });

    // Scroll to top animation on click
    $(scrollElem).click(function(){ 
        $('html, body').animate({scrollTop:0}, scrollSpeed); return false; 
    });

})(jQuery);

```


### （5）更改banner图片，侧边栏链接的颜色，页面布局，文章背景，代码样式，添加多说，添加文章目录，给侧边栏添加外链接，更改归档显示的文章数等等

直接进入沸沸腾的博文：[“教你定制Hexo的landscape打造自己的主题”](http://www.jianshu.com/p/b96fd206571a)。


### （6）定制代码样式

定制代码样式:这个必须单拿出来写。

代码的高亮样式在present/source/css/_partial/highlight.styl中。

``` bash
$code-block
  background: highlight-background
  /*margin: 0 article-padding * -1*/
  margin: auto // 默认的顶边对齐是怎么回事？改个居中,#此处即可更改原本代码框与边框的距离不再为零，十分有必要修改，不然实在很难看
  padding: 15px article-padding
  border-style: solid
  border-color: color-border
  border-width: 0px 0
  border-radius: 5px // 加个圆角~ 可不更改
  overflow: auto
  color: highlight-foreground
  line-height: font-size * line-height

$line-numbers
  color: #666
  font-size: 0.85em // 行号大小

...

.highlight
    @extend $code-block
    pre
      border: none
      margin: 0
      padding: 0
    table
      margin: 0
      width: auto
      font-size: 14px // 设置代码字体
      letter-spacing: 1px // 设置字间距，要不太挤了
```



### （7）加入字数统计 WordCount

xiu's Blog：[Hexo next主题加入字数统计 WordCount](http://ixiusama.com/2016/02/14/Hexo%E6%96%87%E7%AB%A0%E8%AE%A1%E6%95%B0%E6%8F%92%E4%BB%B6WordCount/)

在Hexo <font color=red>Landscape主题下添加字数统计</font>和 xiu's Blog略有不同。Landscape中操作如下：

在Hexo根目录下运行

``` bash
npm i --save hoxo-wordcount
```

修改 theme 模板文件，在 E:\~\Hexo\themes\landscape\layout\_partial\article.ejs 文件中，<footer class="article-footer">之后，</footer>之前的区域内加入：

``` bash
<span class="post-count">字数统计：<%= wordcount(post.content) %>  字 </span>
```
即可统计单篇文章的字数。

☆☆☆

中文版博客总字数统计：<b><%= totalcount(site) %></b>

上面这句是统计中文版博客总字数的，可以放到

E:\~\Hexo\themes\landscape\layout\_partial\footer.ejs 或

E:\~\Hexo\themes\landscape\layout\_widget\about_me.ejs 等等其他位置里。



### （8）导航栏logo字体的设置，即更改个人网站title和subtitle字体的颜色

by本文作者。

找到如下路径的header.styl文件，

> E:\~\Blog\Hexo-cn\themes\landscape\source\css\_partial\header.styl

将原始代码：

     $logo-text
      text-decoration: none
      color: #fff    #白色字体
      font-weight: 300
      text-shadow: 0 1px 4px rgba(0, 0, 0, 0.3)
	  
改为如下代码即可，颜色为css代码——可参考 http://flatuicolors.com/ 网站：

     $logo-text
      text-decoration: none
      color: #3498db    #蓝色字体
      font-weight: 300
      text-shadow: 0 1px 4px rgba(0, 0, 0, 0.3)


### （9）多国语言版网站搭建方法

可以直接参考我的[这篇博文](http://phdmeiwp.github.io/Hexo%E5%A6%82%E4%BD%95%E5%BB%BA%E7%AB%8B%E4%B8%AD%E8%8B%B1%E6%96%87%E5%8F%8C%E8%AF%AD%E5%8D%9A%E5%AE%A2/)。


具体操作请参阅[陈年沉念的博文](https://chenyxmr.github.io/2016/08/04/hexo-bilingual/) 。

**本文只提出几点需要特别注意的事项。**


**第一*, 有<font color=red>两个“点号”</font> 在<font color=red>"/public/en"</font> 的前面:

    
修改/en/_config.yml，修改内容如下：

		language: en </br>
		root: /en/  </br>
		public_dir: ../public/en  </br>


**第二**, 也有<font color=red>两个“点号”</font> 在 <font color=red>"commonweal:"</font> 的前面:


接下来在英文网站中添加中文入口。编辑/en/_config.yml，修改menu:中如下内容：

		commonweal: ../


**顺便说一句, [[陈年沉念]](https://chenyxmr.github.io/2016/08/04/hexo-bilingual/)写的"/update.bat" 很方便且实用。**

最后，我自己再补充一点，就是在完全Copy完Hexo网站跟目录的内容后，在新建的/en/文件夹下，node_modules文件夹里面的代码可能不能被完全复制粘贴，此时需要在/en/文件夹下运行以下代码方可顺利发布/en/到网络端：

先 鼠标右键 git bash here，然后运行

		npm install hexo --save
		npm install
		
		npm install hexo-generator-index --save
		npm install hexo-generator-archive --save
		npm install hexo-generator-category --save
		npm install hexo-generator-tag --save
		npm install hexo-server --save
		npm install hexo-deployer-git --save
		npm install hexo-deployer-heroku --save
		npm install hexo-deployer-rsync --save
		npm install hexo-deployer-openshift --save
		npm install hexo-renderer-marked@0.2 --save
		npm install hexo-renderer-stylus@0.2 --save
		npm install hexo-generator-feed@1 --save
		npm install hexo-generator-sitemap@1 --save

完成上述附加的必要操作后，就可以顺利推送双语或多语博客到网络端啦。



## 三、网址分享

by本文作者。

1\. **在线ico图标制作网站**：

<br> http://www.bitbug.net/ 
<br> 直接选本地图片，即可生成.ico文件，比如用于替换hexo-landscape主题自带的 /favicon.ico

<br> 我的ico是现在ppt中制作的，和我的网站logo是同一张图片，
<br> logo图片如下，logo含义可以点击[这里](http://phdmeiwp.github.io/Logo-%E5%90%AB%E4%B9%89/)查看。

<img src="https://github.com/PhDMeiwp/PhDMeiwp.github.io/blob/hexo/Common_images/Mei_Logo.JPG" width="170"/>

2\. **在线二维码生成网站**：

<br> http://www.liantu.com/ 
<br> 生成的二维码默认外边距留白为10px，改成20px更美观，可以对 网址，文本，电话，名片，邮箱，地图等内容设置唯一的二维码 QR code，还可以对生成二维码进行嵌入图片文字或logo等设置。
<br>例如：
<br>网站中文版二维码为：

<img src="https://github.com/PhDMeiwp/PhDMeiwp.github.io/blob/hexo/Common_images/Mei_website_QRcode.png" width="170"/>



## 四、彩蛋专区


>>>文末彩蛋走一波~~~

<img src="https://github.com/PhDMeiwp/PhDMeiwp.github.io/blob/hexo/Common_images/caidan.gif" width="170"/>


0、我的Hexo网站搭建[所有文章传送门](http://phdmeiwp.github.io/categories/Hexo/)

**各单篇博文传送门>>>**

1、[Hexo 添加鼠标移动右上角可删除的图片](http://phdmeiwp.github.io/Hexo-%E6%B7%BB%E5%8A%A0%E9%BC%A0%E6%A0%87%E7%A7%BB%E5%8A%A8%E5%8F%B3%E4%B8%8A%E8%A7%92%E5%8F%AF%E5%88%A0%E9%99%A4%E7%9A%84%E5%9B%BE%E7%89%87/)

2、[Hexo 实现多终端同步](http://phdmeiwp.github.io/Hexo-%E5%AE%9E%E7%8E%B0%E5%A4%9A%E7%BB%88%E7%AB%AF%E5%90%8C%E6%AD%A5/)

3、[Hexo更改banner和footer的宽度，不要平铺整个页面](http://phdmeiwp.github.io/Hexo%E6%9B%B4%E6%94%B9banner%E5%92%8Cfooter%E7%9A%84%E5%AE%BD%E5%BA%A6%EF%BC%8C%E4%B8%8D%E8%A6%81%E5%B9%B3%E9%93%BA%E6%95%B4%E4%B8%AA%E9%A1%B5%E9%9D%A2/)

4、[不蒜子统计的 Bugs](http://phdmeiwp.github.io/%E4%B8%8D%E8%92%9C%E5%AD%90%E7%BB%9F%E8%AE%A1%E7%9A%84-Bugs/)

5、[多说评论即将关闭，Hexo博客用户看来得换回Disqus评论了](http://phdmeiwp.github.io/%E5%A4%9A%E8%AF%B4%E8%AF%84%E8%AE%BA%E5%8D%B3%E5%B0%86%E5%85%B3%E9%97%AD%EF%BC%8CHexo%E5%8D%9A%E5%AE%A2%E7%94%A8%E6%88%B7%E7%9C%8B%E6%9D%A5%E5%BE%97%E6%8D%A2%E5%9B%9EDisqus%E8%AF%84%E8%AE%BA%E4%BA%86/)


6 、[Hexo：给图标或图片添加链接网址和文字说明](http://phdmeiwp.github.io/Hexo%EF%BC%9A%E7%BB%99%E5%9B%BE%E6%A0%87%E6%88%96%E5%9B%BE%E7%89%87%E6%B7%BB%E5%8A%A0%E9%93%BE%E6%8E%A5%E7%BD%91%E5%9D%80%E5%92%8C%E6%96%87%E5%AD%97%E8%AF%B4%E6%98%8E/)

7、[Hexo：如何解决本地更新文件后无法在个人网站中显示](http://phdmeiwp.github.io/Hexo%EF%BC%9A%E5%A6%82%E4%BD%95%E8%A7%A3%E5%86%B3%E6%9C%AC%E5%9C%B0%E6%9B%B4%E6%96%B0%E6%96%87%E4%BB%B6%E5%90%8E%E6%97%A0%E6%B3%95%E5%9C%A8%E4%B8%AA%E4%BA%BA%E7%BD%91%E7%AB%99%E4%B8%AD%E6%98%BE%E7%A4%BA/)

8、[Hexo：如何解决categories显示分类文件404出错](http://phdmeiwp.github.io/Hexo%EF%BC%9A%E5%A6%82%E4%BD%95%E8%A7%A3%E5%86%B3categories%E6%98%BE%E7%A4%BA%E5%88%86%E7%B1%BB%E6%96%87%E4%BB%B6404%E5%87%BA%E9%94%99/)

9、[Hexo：如何解决 FATAL Cannot read property 'code' of undefined](http://phdmeiwp.github.io/Hexo%EF%BC%9A%E5%A6%82%E4%BD%95%E8%A7%A3%E5%86%B3-FATAL-Cannot-read-property-code-of-undefined/)

10、[Hexo landscape 添加腾讯公益404帮助寻找失踪儿童页面](http://phdmeiwp.github.io/Hexo-landscape-%E6%B7%BB%E5%8A%A0%E8%85%BE%E8%AE%AF%E5%85%AC%E7%9B%8A404%E5%B8%AE%E5%8A%A9%E5%AF%BB%E6%89%BE%E5%A4%B1%E8%B8%AA%E5%84%BF%E7%AB%A5%E9%A1%B5%E9%9D%A2/)


11、[hexo landscape中如何将导航栏设置为banner的底部](http://phdmeiwp.github.io/hexo-landscape%E4%B8%AD%E5%A6%82%E4%BD%95%E5%B0%86%E5%AF%BC%E8%88%AA%E6%A0%8F%E8%AE%BE%E7%BD%AE%E4%B8%BAbanner%E7%9A%84%E5%BA%95%E9%83%A8/)

12、[Hexo如何建立中英文双语博客](http://phdmeiwp.github.io/Hexo%E5%A6%82%E4%BD%95%E5%BB%BA%E7%AB%8B%E4%B8%AD%E8%8B%B1%E6%96%87%E5%8F%8C%E8%AF%AD%E5%8D%9A%E5%AE%A2/)

13、[进阶之Hexo的landscape主题的README文件](http://phdmeiwp.github.io/%E8%BF%9B%E9%98%B6%E4%B9%8BHexo%E7%9A%84landscape%E4%B8%BB%E9%A2%98%E7%9A%84README%E6%96%87%E4%BB%B6/)

14、[Hexo Landscape 如何更改上一篇下一篇链接的字体颜色](http://phdmeiwp.github.io/Hexo-Landscape-%E5%A6%82%E4%BD%95%E6%9B%B4%E6%94%B9%E4%B8%8A%E4%B8%80%E7%AF%87%E4%B8%8B%E4%B8%80%E7%AF%87%E9%93%BE%E6%8E%A5%E7%9A%84%E5%AD%97%E4%BD%93%E9%A2%9C%E8%89%B2/)

15、[Hexo发表文章通用内容部分的设置](http://phdmeiwp.github.io/Hexo%E5%8F%91%E8%A1%A8%E6%96%87%E7%AB%A0%E9%80%9A%E7%94%A8%E5%86%85%E5%AE%B9%E9%83%A8%E5%88%86%E7%9A%84%E8%AE%BE%E7%BD%AE/)


16、[Hexo Landscape 如何自定义（添加）个性化导航栏](http://phdmeiwp.github.io/Hexo-Landscape-%E5%A6%82%E4%BD%95%E8%87%AA%E5%AE%9A%E4%B9%89%EF%BC%88%E6%B7%BB%E5%8A%A0%EF%BC%89%E4%B8%AA%E6%80%A7%E5%8C%96%E5%AF%BC%E8%88%AA%E6%A0%8F/)


## Q&A

如果您有任何问题，欢迎在我的个人网站 [留言栏](http://phdmeiwp.github.io/message/) 进行留言，我会尽力回复。