#!/bin/bash

set -e

# 工作目录
work_dir="/home/buercorp"

# 项目目录
work_home="${work_dir}/repository/appdemo-fe"

# 源码目录

code_home="${work_dir}/repository"

# 存放打包后的代码
web_home="${work_dir}/deploy/appdemo-fe"


# Git仓库地址
git_repo="https://gitee.com/nancheng-p/appdemo-fe.git"

if [ -d "$work_home" ]; then
    echo "— — 工作目录存在 — —"
    cd "$work_home"
    git reset --hard HEAD
    echo "— — 正在更新项目... — —"
    git pull origin master
    echo "— — — — 项目已更新— — — —"
else
    mkdir -p "$code_home"
    echo "正在为你拉取最新的项目"
    git clone $git_repo "$code_home"
    echo "— — 项目已克隆— — — —"


fi

cd "$work_home/source"
/home/buercorp/apps/node/bin/npm install
echo "依赖库已经安装完成"

/home/buercorp/apps/node/bin/npm run build
echo "项目已打包"

sudo mv "$work_home/source/dist" "$web_home"