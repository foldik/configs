function vim
  nvim $argv
end

set -gx PATH $PATH ~/code/java-microservices/make

~/tmux/tmux attach -t default || ~/tmux/tmux new -s default
