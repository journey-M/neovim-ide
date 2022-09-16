if status is-interactive
    # Commands to run in interactive sessions can go here
end
if test -f ~/.autojump/share/autojump/autojump.fish; . ~/.autojump/share/autojump/autojump.fish; end

#for rust
set -gx PATH ~/.cargo/bin $PATH
#for mycmds
set -gx PATH $PATH ~/.cmds
set -gx PATH $PATH /opt/flutter/bin/
set -gx PATH $PATH ~/.local/share/gem/ruby/3.0.0/bin
alias gst "git status"
alias gbr "git branch"
alias gck "git checkout"
alias gpo "git push origin"
alias gcm "git commit -m"
alias gad "git add ."
abbr  n nvim
abbr  c cd
abbr  ffplay_small ffplay -x 380 -y 300
