#!/bin/zsh

# OpenAI API Key
export OPENAI_API_KEY="YOUR_OPENAI_API_KEY"

# GPT Model
export GPT_MODEL="gpt-3.5-turbo"

# Prompt Map
typeset -A PROMPT_MAP

PROMPT_MAP["bug"]="As a tester, generate a bug report using the given input (%s) with the structure: Summary, Steps to reproduce, Expected result, Actual result, References. Add a bullet to References with a list of links to error report, screenshot, etc. Apply markdown to response with component names in backticks and code snippets in codeblocks."

PROMPT_MAP["code"]="As a software developer, review the provided code (%s) and propose potential enhancements."

PROMPT_MAP["doc"]="As a product owner, create a document based on the given input (%s). Apply markdown formatting to the response, using backticks for component names and codeblocks for code snippets."

PROMPT_MAP["story"]="As a business analyst, write a user story based on the provided input (%s) with the structure: Summary, Functional notes, Acceptance criteria, Test notes. Add a bullet to Test notes to perform a visual test in Storybook. Apply markdown formatting to the response, using backticks for component names and code snippets in codeblocks."

PROMPT_MAP["task"]="As a software developer, write a task based on the provided input (%s) with the structure: Summary, Code suggestion, Test notes. Add a bullet to Test Notes to perform a regression test in Vercel. Apply markdown formatting to the response, using backticks for component names and code snippets in codeblocks."

export PROMPT_MAP