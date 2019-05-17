# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/joel/.zsh/zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# lines added by sirjofri
source ~/.zsh/zsh_aliases
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd ' ' edit-command-line
setopt correct
setopt hist_ignore_all_dups
setopt prompt_subst
RPROMPT='%F{cyan}$vcs_info_msg_0_%f'
zstyle ':vcs_info:git:*' formats '%b'
PROMPT='%F{yellow}%n%f%F{blue}@%F{green}%m%f %F{yellow}%1~%f %F{cyan}%#%f '

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

welcome() {
	( if [ "$(tput cols)" -gt "64" ]; then cal -3 -w --color=always; else cal -w --color=always; fi && echo "Next Dates:" && calendar -y -p2 && yes '=' | head -n$(tput cols) | tr -d '\n' ) | lolcat
}
welcome
