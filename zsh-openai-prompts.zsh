#--------------------------------------------------------------------#
# Utilities                                                          #
#--------------------------------------------------------------------#

_get_openai_completion() {

    if [ ! -n "$OPENAI_API_KEY" ]; then
      echo "ERROR: Please set an environment variable for OPENAI_API_KEY"
      exit 1
    fi

    echo -ne "\nLoading...\\r"

    clean_input=$(printf '%s' "$1" | tr -d '"' | tr -d '\n')

    response=$(curl -s https://api.openai.com/v1/chat/completions \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $OPENAI_API_KEY" \
      -d '{
        "model": "gpt-3.5-turbo",
        "messages": [
            {
                "role": "user",
                "content": "'"$clean_input"'"
            }
        ]
      }')

    generated_text=$(printf '%s' "$response" | jq '.choices[0].message.content' | sed -e 's/^"//' -e 's/"$//')

    printf "$generated_text\n"
    printf "$generated_text\n" | pbcopy
}


#--------------------------------------------------------------------#
# Variables                                                          #
#--------------------------------------------------------------------#

requirements="Requirements: return markdown, render component names in
backticks, render code snippets in codeblocks"

#--------------------------------------------------------------------#
# Prompts                                                            #
#--------------------------------------------------------------------#

bug() {

    [ -n "$1" ] && _get_openai_completion \
        "Write bug report based on input: $1.
            Apply format and requirements below.

            Format:
            ## Summary
            ## Steps to reproduce
            ## Expected result
            ## Actual result
            ## References
            - List links to error report, screenshots, etc.

            $requirements"
}

doc() {

    [ -n "$1" ] && _get_openai_completion \
        "Write document based on input: $1.
            Apply requirements below.

            $requirements"
}

gen() {

    [ -n "$1" ] && _get_openai_completion "$1"
}

story() {

    [ -n "$1" ] && _get_openai_completion \
        "Write user story based on input: $1.
            Apply format and requirements below.

            Format:
            ## Summary
            ## Functional notes
            ## Acceptance criteria
            ## Test notes
            - Visually test in Storybook

            $requirements"
}


task() {

    [ -n "$1" ] && _get_openai_completion \
        "Write task based on input: $1.
            Apply format and requirements below.

            Format:
            ## Summary
            ## Code suggestions
            ## Test notes
            - Regression test in Vercel environments

            $requirements"
}
