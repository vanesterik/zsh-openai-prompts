# zsh-openai-prompts plugin
Various OpenAI prompts in zsh

## Requirements
- OpenAI API key exported in your `.zshrc` config file
- Install of `jq` command-line JSON processor

## Installation

Plug with Zap in your .zshrc configuration:

```zsh
plug "koendirkvanesterik/zsh-openai-prompts"
```

## Usage

1. Type the following example in your terminal of choice:

```zsh
story "Elevate header component to latest design guidelines"
```

2. Wait a few moments for OpenAI to respond

3. ... 🍻

4. The response is copied to your clipboard and is ready to go

## Prompts

The plugin comes with the following prompts:

|Name   |Description              |
|-------|-------------------------|
|`bug`  |Generate bug report      |
|`doc`  |Generate general document|
|`gen`  |Ask generic question     |
|`story`|Generate user story      |
|`task` |Generate task ticket     |

