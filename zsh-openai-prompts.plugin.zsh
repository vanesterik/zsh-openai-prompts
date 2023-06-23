#!/bin/zsh

[ ! -f ~/.zsh-openai-prompts-config.zsh ] && cp .zsh-openai-prompts-config.zsh.example ~/.zsh-openai-prompts-config.zsh

source ~/.config.zsh
source "${0:A:h}/zsh-openai-prompts.zsh"
