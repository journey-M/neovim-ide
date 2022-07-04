if status is-interactive
    # Commands to run in interactive sessions can go here
end
if test -f /home/guoweiji/.autojump/share/autojump/autojump.fish; . /home/guoweiji/.autojump/share/autojump/autojump.fish; end


set -gx PATH $PATH /home/guoweiji/.cmds
set -gx PATH $PATH /opt/flutter/bin/
set -gx PATH $PATH ~/.local/share/gem/ruby/3.0.0/bin
alias gst "git status"
alias gbr "git branch"
alias gco "git checkout"
abbr  n nvim
abbr  c cd
