@echo off
git init & git add . & git commit -m "local changes" & git branch hexo & git remote add origin git@github.com:PhDMeiwp/PhDMeiwp.github.io.ver1.git & git pull origin hexo -f
