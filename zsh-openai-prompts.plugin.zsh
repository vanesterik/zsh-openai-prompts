#!/bin/zsh

[ ! -f ~/.zsh-openai-prompts.config ] && cp zsh-openai-prompts.config.example ~/.zsh-openai-prompts.config

source ~/.config.zsh
source "${0:A:h}/zsh-openai-prompts.zsh"
