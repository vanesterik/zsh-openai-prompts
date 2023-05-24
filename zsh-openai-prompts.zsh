#!/bin/zsh

ai() {

    # Check if the OPENAI_API_KEY environment variable is set
    if [ ! -n "$OPENAI_API_KEY" ]; then
        echo "ERROR: Please set an environment variable for OPENAI_API_KEY"
        return
    fi

    # Check if the GPT_MODEL environment variable is set
    if [ ! -n "$GPT_MODEL" ]; then
        echo "ERROR: Please set an environment variable for GPT_MODEL"
        return
    fi

    # Check if arguments were passed
    if [ ! -n "$1" ]; then
        echo "ERROR: Please provide input to proceed with AI assistance"
        return
    fi

    # Define local variables
    local input=$1
    local type=$2
    local content=""

    # Check if prompt type was passed, otherwise use input directly
    if [[ -n $type ]]; then
        local template="${PROMPT_MAP["$type"]}"
        if [[ -n $template ]]; then
            local formatted_template=$(printf "$template" "$input")
            content="$formatted_template"
        else
            echo "ERROR: Unknown prompt type: $type"
            return
        fi
    else
        content="$input"
    fi

    # Clean content by removing quotes and newlines
    clean_content=$(printf '%s' "$content" | tr -d '"' | tr -d '\n')

    # Display loading message
    echo -ne "\nLoading...\\r"

    # Send the prompt to the OpenAI API
    response=$(curl -s https://api.openai.com/v1/chat/completions \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $OPENAI_API_KEY" \
        -d '{
        "model": "'"$GPT_MODEL"'",
        "messages": [
            {
                "role": "user",
                "content": "'"$clean_content"'"
            }
        ]
      }')

    # Get the generated text from the response
    generated_text=$(printf '%s' "$response" | jq '.choices[0].message.content' | sed -e 's/^"//' -e 's/"$//')

    # Print the generated text
    printf "$generated_text\n"

    # Copy the generated text to the clipboard
    printf "$generated_text\n" | pbcopy
}
