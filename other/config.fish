
if status is-interactive
    # Commands to run in interactive sessions can go here
end

#for rust
#for mycmds
set -gx PATH $PATH ~/.cmds
set -gx PATH $PATH /home/guoweijie/archTools/gn/out/
set -gx PATH $PATH /home/guoweijie/archTools/depot_tools/

alias gst "git status"
alias gbr "git branch"
alias gck "git checkout"
alias gpo "git push origin"
alias gcm "git commit -m"
alias gad "git add ."
alias j "autojump"
abbr  n nvim
abbr  c cd
abbr  ffplay_small ffplay -x 380 -y 300
