@echo off
del /a /f /s /q "F:\Blog\Hexo.ver.2\.git\*.*" & git init & git add -A & git commit -m "Blog source files" & git branch hexo & git remote add origin git@github.com:PhDMeiwp/PhDMeiwp.github.io.ver1.git & git push origin hexo -f
