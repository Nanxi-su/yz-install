#!/bin/bash

# 判断 node.js 是否已安装
if ! command -v node &> /dev/null
then
    # 安装 node.js
    curl -fsSL https://deb.nodesource.com/setup_19.x | bash - && apt-get install -y nodejs
fi

# 判断浏览器是否已安装
if ! command -v google-chrome &> /dev/null
then
    # 更新系统并安装浏览器
    apt update
    sudo apt-get install -y ca-certificates fonts-liberation libappindicator3-1 libasound2 libatk-bridge2.0-0 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgbm1 libgcc1 libglib2.0-0 libgtk-3-0 libnspr4 libnss3 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 lsb-release wget xdg-utils
fi

# 判断 redis 是否已安装
if ! command -v redis-server &> /dev/null
then
    # 安装 redis
    sudo apt install -y redis-server
fi

# 判断 git 是否已安装
if ! command -v git &> /dev/null
then
    # 安装 git
    apt install -y git
fi

#判断 中文包 是否安装
if ! command -v task-chinese-s-desktop &> /dev/null
then
    # 安装 中文包
    sudo apt install -y task-chinese-s-desktop
fi



# 克隆喵崽
if [ ! -d "Miao-Yunzai" ]
then
    git clone --depth=1 https://gitee.com/yoimiya-kokomi/Miao-Yunzai.git
fi

# 进入喵崽文件夹
cd Miao-Yunzai

# 克隆喵喵，默认安装
if [ ! -d "plugins/miao-plugin" ]
then
    git clone --depth=1 https://gitee.com/yoimiya-kokomi/miao-plugin.git ./plugins/miao-plugin/
fi

# 克隆图鉴，让用户选择是否安装
while true; do
    read -p "是否安装图鉴插件? (y/n) " yn
    case $yn in
        [Yy]* ) 
            if [ ! -d "plugins/xiaoyao-cvs-plugin" ]
            then
                git clone https://gitee.com/Ctrlcvs/xiaoyao-cvs-plugin.git ./plugins/xiaoyao-cvs-plugin/
            fi
            break;;
        [Nn]* ) break;;
        * ) echo "请输入 y 或 n.";;
    esac
done

# 克隆锅巴，让用户选择是否安装
while true; do
    read -p "是否安装锅巴插件? (y/n) " yn
    case $yn in
        [Yy]* ) 
            if [ ! -d "plugins/Guoba-Plugin" ]
            then
                git clone --depth=1 https://gitee.com/guoba-yunzai/guoba-plugin.git ./plugins/Guoba-Plugin/
            fi
            break;;
        [Nn]* ) break;;
        * ) echo "请输入 y 或 n.";;
    esac
done

# 安装 pnpm
if ! command -v pnpm &> /dev/null
then
    npm install pnpm -g
fi

# 安装依赖
pnpm install -P&&sudo apt install ffmpeg&&sudo apt install python3
#重启系统
sudo systemctl reboot
