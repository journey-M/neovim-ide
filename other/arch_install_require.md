

vscode 配置c++ 环境 
plugin: CMake  clangd  CodeLLDB

中文输入法:

fcitx5  fcitx5-addonse  ... qt gkt

添加 ~/.bashrc
export LANG=zh_CN.UTF-8
export LANGUAGE=zh_CN:en_US
export LC_CTYPE=zh_CN.UTF-8

添加  ~/.xprofile

export XMODIFIERS="@im=fcitx5"
export XMODIFIER="@im=fcitx5"
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export DefaultIMModule=fcitx5
fcitx5 &
