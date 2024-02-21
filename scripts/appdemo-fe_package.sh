#!/bin/bash

set -e

# 工作目录
work_dir="/home/buercorp"

# 项目目录
work_home="${work_dir}/repository/appdemo-fe"

# 存放打包后的代码
js_home="${work_dir}/apps/nginx/appdemo-web"

# 源码目录
code_home="${work_dir}/repository"

# Git仓库地址
git_repo="https://github.com/175T/appdemo-be.git"

if [ -d "$work_home" ]; then
    echo "— — 工作目录存在 — —"
    cd "$work_home"
    echo "— — 正在更新项目... — —"
    git pull origin master
    echo "— — — — 项目已更新— — — —"
else
    echo "未检测到需要打包的api"
    echo "正在为你拉取最新的项目"
    git clone $git_repo "$code_home"
    echo "— — 项目已克隆— — — —"
fi

cd "$work_home/source"
npm install
echo "依赖库已经安装完成"

npm run build
echo "项目已打包"

mv "$work_home/source/dist" "$js_home"