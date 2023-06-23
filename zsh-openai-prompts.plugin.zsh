#!/bin/zsh

config_file=~/.zsh-openai-prompts.config

[ ! -f $config_file ] && cp "${0:A:h}/zsh-openai-prompts.config.example" $config_file

source $config_file
source "${0:A:h}/zsh-openai-prompts.zsh"
