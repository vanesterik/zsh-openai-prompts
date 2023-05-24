# zsh-openai-prompts plugin

Various OpenAI prompts in zsh

## Requirements

- OpenAI API key exported in your `.zshrc` config file
- Install of `jq` command-line JSON processor

## Installation

1. Clone this repository on your local machine

2. Copy `.config.zsh.example` and rename to `.config.zsh`.

3. Fill in your own `OPENAI_API_KEY` in aforementioned config file

4. Plug with Zap in your .zshrc configuration:

   ```zsh
   plug "koendirkvanesterik/zsh-openai-prompts"
   ```

5. Ready for action 🚀

## Usage

1. Type the following example in your terminal of choice:

   ```zsh
   ai "Elevate header component to latest design guidelines" story
   ```

2. Wait a few moments for OpenAI to respond

3. ... 🍻

4. The response is copied to your clipboard and is ready to be used

## Prompts

The plugin comes with the following prompts types:

| Name    | Description               |
| ------- | ------------------------- |
| `bug`   | Generate bug report       |
| `code`  | Review code               |
| `doc`   | Generate general document |
| `story` | Generate user story       |
| `task`  | Generate task ticket      |
