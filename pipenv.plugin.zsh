function pipenv_chpwd() {
    # Check if Pipfile exists in pwd or either the parent dir or the parents parent dir
    if [[ ! -e "$PWD/Pipfile" ]]; then
        if [[ ! -e "$PWD/../Pipfile" ]]; then
            if [[ ! -e "$PWD/../../Pipfile" ]]; then
                return
            fi
        fi
    fi
    
    if [[ ! "$PIPENV_ACTIVE" ]]; then
        if pipenv --venv >/dev/null 2>&1; then
            pipenv shell
        fi
    fi
}

# Only add this to the chpwd hooks if pipenv is installed.
# This means that the shell will likely need to be reloaded if pipenv is installed.
if command -v pipenv > /dev/null; then
    chpwd_functions+=(pipenv_chpwd)
fi

# Completions until I can find a faster (full featured) solution
#compdef pipenv
_pipenv() {
    eval $(env COMMANDLINE="${words[1,$CURRENT]}" _PIPENV_COMPLETE=complete-zsh  pipenv)
}
if [[ "$(basename -- ${(%):-%x})" != "_pipenv" ]]; then
  compdef _pipenv pipenv
fi
