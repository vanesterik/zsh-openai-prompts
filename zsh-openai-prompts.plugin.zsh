#!/bin/zsh

[ ! -f ~/.config.zsh ] && cp .config.zsh.example ~/.config.zsh

source ~/.config.zsh
source "${0:A:h}/zsh-openai-prompts.zsh"
