#!/bin/zsh

config_file=~/.zsh-openai-prompts.config.zsh

[ ! -f $config_file ] && cp "${0:A:h}/zsh-openai-prompts.config.example.zsh" $config_file

source $config_file
source "${0:A:h}/zsh-openai-prompts.zsh"
